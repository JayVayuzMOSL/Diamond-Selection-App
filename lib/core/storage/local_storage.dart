import 'package:get_storage/get_storage.dart';
import 'package:kgk_diamonds_group_app/data/models/diamond_model.dart';

class LocalStorage {
  static final GetStorage _box = GetStorage(); // GetStorage instance
  static const String _cartKey = "cart_items"; // Storage key

  /// Save a list of diamonds (replace old cart)
  void saveCartItems(List<DiamondModel> cartItems) {
    final List<Map<String, dynamic>> jsonList =
        cartItems.map((diamond) => diamond.toJson()).toList();
    _box.write(_cartKey, jsonList);
  }

  /// Get all diamonds from the cart
  List<DiamondModel> getCartItems() {
    final List<dynamic>? jsonList = _box.read(_cartKey);
    if (jsonList == null) return [];
    return jsonList.map((json) => DiamondModel.fromJson(json)).toList();
  }

  /// Add a diamond to the cart
  void addToCart(DiamondModel diamond) {
    List<DiamondModel> cart = getCartItems();
    cart.add(diamond);
    saveCartItems(cart);
  }

  /// Remove a diamond from the cart
  void removeFromCart(String lotId) {
    List<DiamondModel> cart = getCartItems();
    cart.removeWhere((diamond) => diamond.lotId == lotId);
    saveCartItems(cart);
  }

  /// Clear the entire cart
  void clearCart() {
    _box.remove(_cartKey);
  }
}
