import 'package:kgk_diamonds_group_app/core/storage/local_storage.dart';
import 'package:kgk_diamonds_group_app/core/usecases/usecase.dart';

class ClearCartUsecase extends UseCase<void, void> {
  final LocalStorage localStorage;

  ClearCartUsecase(this.localStorage);

  @override
  void call(void params) {
    localStorage.clearCart();
  }
}
