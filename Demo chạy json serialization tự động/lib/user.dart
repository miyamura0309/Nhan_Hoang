import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';  // bắt buộc phải có

@JsonSerializable()
class User {
  final String name;
  final int age;
  User(this.name, this.age);
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}


