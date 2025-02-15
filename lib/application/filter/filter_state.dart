import 'package:kgk_diamonds_group_app/data/models/diamond_model.dart';

class FilterState {
  final double caratFrom;
  final double caratTo;
  final String selectedLab;
  final String selectedShape;
  final String selectedColor;
  final String selectedClarity;
  final double qty;
  final List<DiamondModel>? diamondModel;

  const FilterState(
      {required this.caratFrom,
      required this.caratTo,
      required this.selectedLab,
      required this.selectedShape,
      required this.selectedColor,
      required this.selectedClarity,
      required this.qty,
      this.diamondModel});

  factory FilterState.initial() {
    return const FilterState(
      caratFrom: 0.0,
      caratTo: 5.0,
      qty: 0,
      selectedLab: '',
      selectedShape: '',
      selectedColor: '',
      selectedClarity: '',
    );
  }

  FilterState copyWith(
      {double? caratFrom,
      double? caratTo,
      String? selectedLab,
      String? selectedShape,
      String? selectedColor,
      String? selectedClarity,
      double? qty,
      List<DiamondModel>? diamondModel}) {
    return FilterState(
        caratFrom: caratFrom ?? this.caratFrom,
        caratTo: caratTo ?? this.caratTo,
        selectedLab: selectedLab ?? this.selectedLab,
        selectedShape: selectedShape ?? this.selectedShape,
        selectedColor: selectedColor ?? this.selectedColor,
        selectedClarity: selectedClarity ?? this.selectedClarity,
        qty: qty ?? this.qty,
        diamondModel: diamondModel ?? this.diamondModel);
  }
}
