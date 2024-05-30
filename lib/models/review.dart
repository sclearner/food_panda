import 'package:json_annotation/json_annotation.dart';

part 'review.g.dart';

@JsonSerializable()
class Review {
  String? id;
  String menuId;
  String userId;
  int reviewStar;
  String? description;
  late DateTime createdAt;
  List<String>? imageLinks;

  Review({this.id, required this.menuId, required this.userId, required this.reviewStar, this.description, DateTime? createdAt , this.imageLinks}) {
    this.createdAt = DateTime.now();
  }

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
