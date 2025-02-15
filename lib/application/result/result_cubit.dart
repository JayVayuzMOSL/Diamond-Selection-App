import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:kgk_diamonds_group_app/application/filter/filter_cubit.dart';
import 'package:kgk_diamonds_group_app/core/constants/enums.dart';
import 'package:kgk_diamonds_group_app/data/models/diamond_model.dart';
import 'package:kgk_diamonds_group_app/domain/repositories/diamond_repository_interface.dart';
import 'package:kgk_diamonds_group_app/domain/usecases/filter/apply_filter_usecase.dart';

import 'result_state.dart';

class ResultCubit extends HydratedCubit<ResultState> {
  final DiamondRepositoryInterface diamondRepository;
  final FilterCubit filterCubit;
  late StreamSubscription filterSubscription;
  final ApplyFilterUseCase applyFilterUseCase;

  ResultCubit(
      {required this.diamondRepository,
      required this.filterCubit,
      required this.applyFilterUseCase})
      : super(ResultInitial());

  /// Load all diamonds if no filters are applied
  void filteredDiamondList({Map<String, dynamic>? filters}) async {
    emit(ResultLoading());
    try {
      final diamonds = await applyFilterUseCase(filters ?? {});
      emit(ResultLoaded(diamonds));
    } catch (e) {
      emit(ResultError('Failed to load diamonds: ${e.toString()}'));
    }
  }

  void sortDiamonds(SortOption sortOption) {
    if (state is ResultLoaded) {
      List<DiamondModel> sortedDiamonds = List.from((state as ResultLoaded).diamonds);

      switch (sortOption) {
        case SortOption.priceHighToLow:
          sortedDiamonds
              .sort((a, b) => (b.carat * b.perCaratRate).compareTo(a.carat * a.perCaratRate));
          break;
        case SortOption.priceLowToHigh:
          sortedDiamonds
              .sort((a, b) => (a.carat * a.perCaratRate).compareTo(b.carat * b.perCaratRate));
          break;
        case SortOption.caratHighToLow:
          sortedDiamonds.sort((a, b) => b.carat.compareTo(a.carat));
          break;
        case SortOption.caratLowToHigh:
          sortedDiamonds.sort((a, b) => a.carat.compareTo(b.carat));
          break;
      }

      emit(ResultLoaded(sortedDiamonds));
    }
  }

  /// **Persist State using HydratedBloc**
  @override
  ResultState? fromJson(Map<String, dynamic> json) {
    try {
      final diamonds =
          (json['diamonds'] as List).map((diamond) => DiamondModel.fromJson(diamond)).toList();
      return ResultLoaded(diamonds);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(ResultState state) {
    if (state is ResultLoaded) {
      return {
        'diamonds': state.diamonds.map((diamond) => diamond.toJson()).toList(),
      };
    }
    return null;
  }

  @override
  Future<void> close() {
    filterSubscription.cancel();
    return super.close();
  }
}
