// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Menu _$MenuFromJson(Map<String, dynamic> json) => Menu(
      id: json['id'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      reviewStar: (json['reviewStar'] as num?)?.toDouble(),
      reviewCount: (json['reviewCount'] as num?)?.toInt(),
      openTime: json['openTime'] == null
          ? null
          : DateTime.parse(json['openTime'] as String),
      closeTime: json['closeTime'] == null
          ? null
          : DateTime.parse(json['closeTime'] as String),
      contact: json['contact'] as String?,
      gallery:
          (json['gallery'] as List<dynamic>?)?.map((e) => e as String).toList(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      description: json['description'] as String?,
      dishes: (json['dishes'] as List<dynamic>?)
          ?.map((e) => Dish.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuToJson(Menu instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'reviewStar': instance.reviewStar,
      'reviewCount': instance.reviewCount,
      'openTime': instance.openTime?.toIso8601String(),
      'closeTime': instance.closeTime?.toIso8601String(),
      'contact': instance.contact,
      'gallery': instance.gallery,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'description': instance.description,
      'dishes': instance.dishes,
    };
