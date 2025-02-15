import 'package:freezed_annotation/freezed_annotation.dart';

part 'diamond_model.freezed.dart';
part 'diamond_model.g.dart';

@freezed
class DiamondModel with _$DiamondModel {
  const factory DiamondModel({
    required String qty,
    required String lotId,
    required String size,
    required double carat,
    required String lab,
    required String shape,
    required String color,
    required String clarity,
    required String cut,
    required String polish,
    required String symmetry,
    required String fluorescence,
    required double discount,
    required double perCaratRate,
    required String keyToSymbol,
    required String labComment,
  }) = _DiamondModel;

  factory DiamondModel.fromJson(Map<String, dynamic> json) => _$DiamondModelFromJson(json);
}
