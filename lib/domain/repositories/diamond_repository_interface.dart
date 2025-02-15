import 'package:kgk_diamonds_group_app/data/models/diamond_model.dart';

abstract class DiamondRepositoryInterface {
  Future<List<DiamondModel>> getFilteredDiamonds({Map<String, dynamic> filters});

  Future<List<DiamondModel>> loadDiamondsFromExcel();
}
