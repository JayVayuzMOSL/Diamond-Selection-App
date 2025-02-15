import 'package:kgk_diamonds_group_app/data/models/diamond_model.dart';
import 'package:kgk_diamonds_group_app/domain/repositories/diamond_repository_interface.dart';

class ApplyFilterUseCase {
  final DiamondRepositoryInterface repository;

  ApplyFilterUseCase(this.repository);

  Future<List<DiamondModel>> call(Map<String, dynamic> filters) {
    return repository.getFilteredDiamonds(filters: filters);
  }
}
