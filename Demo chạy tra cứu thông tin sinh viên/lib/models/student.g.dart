// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
  id: json['id'] as String,
  name: json['name'] as String,
  major: json['major'] as String,
  year: (json['year'] as num).toInt(),
  address: Address.fromJson(json['address'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'major': instance.major,
  'year': instance.year,
  'address': instance.address.toJson(),
};
