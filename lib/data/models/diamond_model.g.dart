// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diamond_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiamondModelImpl _$$DiamondModelImplFromJson(Map<String, dynamic> json) => _$DiamondModelImpl(
      qty: json['qty'] as String,
      lotId: json['lotId'] as String,
      size: json['size'] as String,
      carat: (json['carat'] as num).toDouble(),
      lab: json['lab'] as String,
      shape: json['shape'] as String,
      color: json['color'] as String,
      clarity: json['clarity'] as String,
      cut: json['cut'] as String,
      polish: json['polish'] as String,
      symmetry: json['symmetry'] as String,
      fluorescence: json['fluorescence'] as String,
      discount: (json['discount'] as num).toDouble(),
      perCaratRate: (json['perCaratRate'] as num).toDouble(),
      keyToSymbol: json['keyToSymbol'] as String,
      labComment: json['labComment'] as String,
    );

Map<String, dynamic> _$$DiamondModelImplToJson(_$DiamondModelImpl instance) => <String, dynamic>{
      'qty': instance.qty,
      'lotId': instance.lotId,
      'size': instance.size,
      'carat': instance.carat,
      'lab': instance.lab,
      'shape': instance.shape,
      'color': instance.color,
      'clarity': instance.clarity,
      'cut': instance.cut,
      'polish': instance.polish,
      'symmetry': instance.symmetry,
      'fluorescence': instance.fluorescence,
      'discount': instance.discount,
      'perCaratRate': instance.perCaratRate,
      'keyToSymbol': instance.keyToSymbol,
      'labComment': instance.labComment,
    };
