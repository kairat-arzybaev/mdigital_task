// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Car _$CarFromJson(Map<String, dynamic> json) => Car(
      maker: json['maker'] as String,
      model: json['model'] as String,
      year: json['year'] as int,
      sellingPrice: json['sellingPrice'] as int,
    );

Map<String, dynamic> _$CarToJson(Car instance) => <String, dynamic>{
      'maker': instance.maker,
      'model': instance.model,
      'year': instance.year,
      'sellingPrice': instance.sellingPrice,
    };
