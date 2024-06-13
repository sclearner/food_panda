import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dish.g.dart';

@JsonSerializable()
class Dish extends Equatable {
  final String name;
  final double price;
  final String image;

  const Dish({required this.name, required this.price, required this.image});

  @override
  List<Object?> get props => [name, price, image];

  factory Dish.fromJson(Map<String, dynamic> json) => _$DishFromJson(json);

  Map<String, dynamic> toJson() => _$DishToJson(this);
}