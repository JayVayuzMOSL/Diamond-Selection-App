import 'package:flutter_bloc/flutter_bloc.dart';

import 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterState.initial());

  void updateCaratRange(double from, double to) {
    emit(state.copyWith(caratFrom: from, caratTo: to));
  }

  void updateLab(String lab) {
    emit(state.copyWith(selectedLab: lab));
  }

  void updateShape(String shape) {
    emit(state.copyWith(selectedShape: shape));
  }

  void updateColor(String color) {
    emit(state.copyWith(selectedColor: color));
  }

  void updateClarity(String clarity) {
    emit(state.copyWith(selectedClarity: clarity));
  }

  void resetFilters() {
    emit(FilterState.initial());
  }

  updateQuantity(double qty) {
    emit(state.copyWith(qty: qty));
  }
}
