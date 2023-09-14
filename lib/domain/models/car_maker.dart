import 'package:json_annotation/json_annotation.dart';

part 'car_maker.g.dart';

@JsonSerializable()
class CarMaker {
  CarMaker({
    required this.name,
    required this.logo,
  });

  final String name;
  final String logo;

  factory CarMaker.fromJson(Map<String, dynamic> json) => _$CarMakerFromJson(json);

   Map<String, dynamic> toJson() => _$CarMakerToJson(this);

}
