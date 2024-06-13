import 'package:equatable/equatable.dart';
import 'package:food_panda/models/dish.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  String? id;
  DateTime bookTime;
  List<String> menuIds;
  int? adults;
  int? children;
  double cost;


  Order({this.id, required this.bookTime, required this.menuIds, this.adults, this.children, required this.cost});

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
