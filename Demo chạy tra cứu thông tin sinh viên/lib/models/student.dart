import 'package:json_annotation/json_annotation.dart';
import 'address.dart';
part 'student.g.dart';
@JsonSerializable(explicitToJson: true)
class Student {
  String id;
  String name;
  String major;
  int year;
  Address address;

  Student({
    required this.id,
    required this.name,
    required this.major,
    required this.year,
    required this.address,
  });

  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
  Map<String, dynamic> toJson() => _$StudentToJson(this);
}
