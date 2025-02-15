import 'package:kgk_diamonds_group_app/core/storage/local_storage.dart';
import 'package:kgk_diamonds_group_app/core/usecases/usecase.dart';
import 'package:kgk_diamonds_group_app/data/models/diamond_model.dart';

class AddToCartUseCase implements UseCase<void, DiamondModel> {
  final LocalStorage localStorage;

  AddToCartUseCase(this.localStorage);

  @override
  void call(DiamondModel diamond) {
    return localStorage.addToCart(diamond); // Use LocalStorage instead of Repository
  }
}
