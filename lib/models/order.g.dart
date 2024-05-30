// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: json['id'] as String?,
      bookTime: DateTime.parse(json['bookTime'] as String),
      menuIds:
          (json['menuIds'] as List<dynamic>).map((e) => e as String).toList(),
      adults: (json['adults'] as num?)?.toInt(),
      children: (json['children'] as num?)?.toInt(),
      cost: (json['cost'] as num).toDouble(),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'bookTime': instance.bookTime.toIso8601String(),
      'menuIds': instance.menuIds,
      'adults': instance.adults,
      'children': instance.children,
      'cost': instance.cost,
    };
