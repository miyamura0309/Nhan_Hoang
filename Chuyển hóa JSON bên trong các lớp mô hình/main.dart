import 'dart:convert';

class User {
  String name;
  int age;
  String gmail;

  User({required this.name, required this.age, required this.gmail});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      age: json['age'],
      gmail: json['gmail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'gmail': gmail,
    };
  }
}

void main() {
  String jsonString = '{"name": "Nguyen Trong Nhan", "age": 21, "gmail": "nhannt.miya@gmail.com"}';
  Map<String, dynamic> userMap = jsonDecode(jsonString);
  User user = User.fromJson(userMap);

  print('--- Thông tin người dùng ---');
  print('Tên: ${user.name}');
  print('Tuổi: ${user.age}');
  print('Gmail: ${user.gmail}');

  String encodedJson = jsonEncode(user.toJson());
  print('\n--- JSON sau khi mã hóa lại ---');
  print(encodedJson);
}