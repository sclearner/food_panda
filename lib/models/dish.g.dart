// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dish _$DishFromJson(Map<String, dynamic> json) => Dish(
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$DishToJson(Dish instance) => <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'image': instance.image,
    };
