import 'package:json_annotation/json_annotation.dart';

part 'car.g.dart';

@JsonSerializable()
class Car {
  Car({
    required this.maker,
    required this.model,
    required this.year,
    required this.sellingPrice,
  });

  final String maker;
  final String model;
  final int year;
  final int sellingPrice;

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);

  Map<String, dynamic> toJson() => _$CarToJson(this);
}
