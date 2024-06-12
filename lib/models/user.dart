import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  const User({this.name, this.email, this.avatarUrl, this.id, this.dob});
  @JsonKey(name: "_id")
  final String? id;
  final String? name;
  final String? email;
  final DateTime? dob;
  final String? avatarUrl;

  @override
  List get props => [id];

  static const guest = User();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}