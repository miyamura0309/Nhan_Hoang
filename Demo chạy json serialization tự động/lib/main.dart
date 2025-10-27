import 'dart:convert';
import 'package:flutter/material.dart';
import 'user.dart';

void main() {
  // JSON mẫu
  final jsonData = '{"name":"Hoàng","age":21}';
  // Chuyển JSON thành object User
  final user = User.fromJson(jsonDecode(jsonData));
  runApp(MyApp(user: user));
}

class MyApp extends StatelessWidget {
  final User user;
  const MyApp({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Demo JSON Serialization')),
        body: Center(
          child: Text(
            'Hello, ${user.name}! Hiện tại bạn đang: ${user.age} tuổi',
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
