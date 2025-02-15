import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kgk_diamonds_group_app/application/cart/cart_cubit.dart';
import 'package:kgk_diamonds_group_app/application/cart/cart_state.dart';
import 'package:kgk_diamonds_group_app/core/themes/app_colors.dart';
import 'package:kgk_diamonds_group_app/core/constants/app_strings.dart';
import 'package:kgk_diamonds_group_app/core/themes/app_styles.dart';
import 'package:kgk_diamonds_group_app/domain/diamond_facade.dart';
import 'package:kgk_diamonds_group_app/presentation/widgets/cart_item_tile.dart';
import 'package:kgk_diamonds_group_app/presentation/widgets/cart_summary.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late DiamondFacade diamondFacade;

  @override
  void initState() {
    super.initState();
    diamondFacade = DiamondFacade.initialize(context);
    diamondFacade.loadCart();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CartError) {
          return Center(
              child: Text(
            state.message,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.textLight,
                ),
          ));
        } else if (state is CartLoaded && state.cartItems.isEmpty) {
          return _buildEmptyCartMessage(context);
        } else if (state is CartLoaded) {
          return Column(
            children: [
              Expanded(
                  child: ListView.builder(
                itemCount: state.cartItems.length,
                itemBuilder: (context, index) {
                  final diamond = state.cartItems[index];
                  return Dismissible(
                    key: Key(diamond.lotId),
                    direction: DismissDirection.endToStart,
                    background: _buildDismissBackground(),
                    onDismissed: (direction) => diamondFacade.removeFromCart(diamond.lotId),
                    child: CartItemTile(
                      diamond: diamond,
                      diamondFacade: diamondFacade,
                    ),
                  );
                },
              )),
              CartSummary(cartItems: state.cartItems),
            ],
          );
        }
        return _buildEmptyCartMessage(context);
      },
    );
  }

  Widget _buildDismissBackground() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.symmetric(horizontal: wRes(20)),
      color: Colors.red,
      child: const Icon(Icons.delete, color: AppColors.backgroundLight),
    );
  }

  Widget _buildEmptyCartMessage(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.cartEmptyTitle,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.textLight,
            ),
      ),
    );
  }
}
