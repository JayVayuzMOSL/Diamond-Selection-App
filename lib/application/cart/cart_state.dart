import 'package:kgk_diamonds_group_app/data/models/diamond_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<DiamondModel> cartItems;

  CartLoaded(this.cartItems);
}

class CartError extends CartState {
  final String message;

  CartError(this.message);
}
