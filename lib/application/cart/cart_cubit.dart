import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:kgk_diamonds_group_app/application/cart/cart_state.dart';
import 'package:kgk_diamonds_group_app/data/models/diamond_model.dart';
import 'package:kgk_diamonds_group_app/domain/usecases/cart/add_to_cart_usecase.dart';
import 'package:kgk_diamonds_group_app/domain/usecases/cart/clear_cart_usecase.dart';
import 'package:kgk_diamonds_group_app/domain/usecases/cart/get_cart_usecase.dart';
import 'package:kgk_diamonds_group_app/domain/usecases/cart/remove_from_cart_usecase.dart';

class CartCubit extends HydratedCubit<CartState> {
  final GetCartUsecase getCartItemsUseCase;
  final AddToCartUseCase addToCartUseCase;
  final RemoveFromCartUsecase removeFromCartUseCase;
  final ClearCartUsecase clearCartUseCase;

  CartCubit({
    required this.getCartItemsUseCase,
    required this.addToCartUseCase,
    required this.removeFromCartUseCase,
    required this.clearCartUseCase,
  }) : super(CartInitial());

  Future<void> loadCart() async {
    emit(CartLoading());
    try {
      final cartItems = getCartItemsUseCase({});
      emit(CartLoaded(cartItems));
    } catch (e) {
      emit(CartError('Failed to load cart: ${e.toString()}'));
    }
  }

  Future<void> addToCart(DiamondModel diamond) async {
    addToCartUseCase(diamond);
    loadCart();
  }

  Future<void> removeFromCart(String lotId) async {
    removeFromCartUseCase(lotId);
    loadCart();
  }

  Future<void> clearCart() async {
    clearCartUseCase({});
    emit(CartLoaded([]));
  }

  // **HydratedBloc Persistence**
  @override
  CartState? fromJson(Map<String, dynamic> json) {
    try {
      final List<dynamic> cartData = json['cartItems'] ?? [];
      final cartItems = cartData.map((item) => DiamondModel.fromJson(item)).toList();
      return CartLoaded(cartItems);
    } catch (_) {
      return CartInitial();
    }
  }

  @override
  Map<String, dynamic>? toJson(CartState state) {
    if (state is CartLoaded) {
      return {
        'cartItems': state.cartItems.map((diamond) => diamond.toJson()).toList(),
      };
    }
    return null;
  }
}
