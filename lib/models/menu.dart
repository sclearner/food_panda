import 'package:food_panda/models/dish.dart';
import 'package:json_annotation/json_annotation.dart';

part 'menu.g.dart';

@JsonSerializable()
class Menu {
  @JsonKey(name: "_id")
  final String id;
  final String title;
  final String subtitle;
  double? reviewStar;
  int? reviewCount;
  DateTime? openTime;
  DateTime? closeTime;
  String? contact;
  List<String>? gallery;
  double? latitude;
  double? longitude;
  String? description;
  List<Dish>? dishes;

  Menu(
      {required this.id,
      required this.title,
      required this.subtitle,
      this.reviewStar,
      this.reviewCount,
      this.openTime,
      this.closeTime,
      this.contact,
      this.gallery,
      this.latitude,
      this.longitude,
      this.description,
      this.dishes});

  static final test = Menu(id: "1", title: "Thực đơn của Viettel", subtitle: '100% chuẩn quân đội', );

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);

  Map<String, dynamic> toJson() => _$MenuToJson(this);
}
