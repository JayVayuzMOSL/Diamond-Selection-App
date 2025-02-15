import 'package:kgk_diamonds_group_app/core/storage/local_storage.dart';
import 'package:kgk_diamonds_group_app/core/usecases/usecase.dart';
import 'package:kgk_diamonds_group_app/data/models/diamond_model.dart';

class GetCartUsecase extends UseCase<List<DiamondModel>, void> {
  final LocalStorage localStorage;

  GetCartUsecase(this.localStorage);

  @override
  List<DiamondModel> call(void params) {
    return localStorage.getCartItems();
  }
}
