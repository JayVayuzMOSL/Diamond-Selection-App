import 'package:flutter/material.dart';
import 'package:kgk_diamonds_group_app/core/themes/app_colors.dart';
import 'package:kgk_diamonds_group_app/core/constants/app_strings.dart';
import 'package:kgk_diamonds_group_app/core/themes/app_styles.dart';
import 'package:kgk_diamonds_group_app/data/models/diamond_model.dart';
import 'package:kgk_diamonds_group_app/domain/diamond_facade.dart';

class CartItemTile extends StatelessWidget {
  final DiamondModel diamond;
  final DiamondFacade diamondFacade;

  const CartItemTile({required this.diamond, super.key, required this.diamondFacade});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: wRes(16), vertical: hRes(8)),
      child: ListTile(
        leading: Image.asset(AppStrings.diamondAsset, width: wRes(50)),
        title: Text(
          '${diamond.carat} ct, ${diamond.color}, ${diamond.clarity}',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.textLight),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('\$${diamond.perCaratRate.toStringAsFixed(2)}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: AppColors.accentLight)),
            Text(diamond.shape,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: AppColors.accentLight)),
          ],
        ),
        trailing: CartItemActions(
          diamond: diamond,
          diamondFacade: diamondFacade,
        ),
      ),
    );
  }
}

class CartItemActions extends StatelessWidget {
  final DiamondModel diamond;
  final DiamondFacade diamondFacade;

  const CartItemActions({required this.diamond, super.key, required this.diamondFacade});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.remove_circle, color: AppColors.greyColor),
          onPressed: () => diamondFacade.updateQuantity(double.parse(diamond.qty) - 1),
        ),
        Text(diamond.qty.toString(),
            style:
                Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.textLight)),
        IconButton(
          icon: const Icon(Icons.add_circle, color: AppColors.greyColor),
          onPressed: () => diamondFacade.updateQuantity(double.parse(diamond.qty) + 1),
        ),
      ],
    );
  }
}
