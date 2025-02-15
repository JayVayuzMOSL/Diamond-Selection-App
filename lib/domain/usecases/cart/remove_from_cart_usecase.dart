import 'package:kgk_diamonds_group_app/core/storage/local_storage.dart';
import 'package:kgk_diamonds_group_app/core/usecases/usecase.dart';

class RemoveFromCartUsecase extends UseCase<void, String> {
  final LocalStorage localStorage;

  RemoveFromCartUsecase(this.localStorage);

  @override
  void call(String params) {
    localStorage.removeFromCart(params);
  }
}
