// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      id: json['id'] as String?,
      menuId: json['menuId'] as String,
      userId: json['userId'] as String,
      reviewStar: (json['reviewStar'] as num).toInt(),
      description: json['description'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      imageLinks: (json['imageLinks'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'id': instance.id,
      'menuId': instance.menuId,
      'userId': instance.userId,
      'reviewStar': instance.reviewStar,
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
      'imageLinks': instance.imageLinks,
    };
