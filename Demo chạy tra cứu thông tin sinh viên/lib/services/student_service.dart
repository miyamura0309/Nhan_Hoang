import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import '../models/student.dart';

final _logger = Logger();

class StudentService {
  // Thay baseUrl bằng API thật nếu bạn có
  final String baseUrl;

  StudentService({this.baseUrl = 'https://example.com/api'});

  /// Gọi API thật: GET /students/{id}
  Future<Student> fetchStudentById(String id) async {
    try {
      final uri = Uri.parse('$baseUrl/students/$id');

      // Nếu bạn muốn thử with real API, comment phần mock bên dưới và uncomment http call
      // final resp = await http.get(uri);
      // if (resp.statusCode == 200) {
      //   final data = jsonDecode(resp.body);
      //   return Student.fromJson(data);
      // } else {
      //   throw Exception('Server responded ${resp.statusCode}');
      // }

      // ----- MOCK (dùng khi không có server) -----
      await Future.delayed(const Duration(milliseconds: 700)); // simulate network
      final mockJson = _mockStudentJson(id);
      final data = jsonDecode(mockJson);
      return Student.fromJson(data);
    } catch (e) {
      _logger.e('fetchStudentById error', e);
      rethrow;
    }
  }

  String _mockStudentJson(String id) {
    // Ví dụ mock cho 2 mã sinh viên, khác trả lỗi
    if (id == '106220229') {
      return jsonEncode({
        "id": "106220229",
        "name": "Nguyễn Trọng Nhân",
        "major": "Kỹ thuật máy tính",
        "year": 4,
        "address": {
          "street": "08 Đường Hà Văn Tính",
          "city": "Đà Nẵng",
          "country": "Việt Nam"
        }
      });
    } else if (id == '106220252') {
      return jsonEncode({
        "id": "106220252",
        "name": "Lê Duy Hoàng",
        "major": "Kỹ thuật máy tính",
        "year": 4,
        "address": {
          "street": "67 Hà Huy Tập",
          "city": "Đà Nẵng",
          "country": "Việt Nam"
        }
      });
    } else if (id == '106220245') {
      return jsonEncode({
        "id": "106220245",
        "name": "Kim Gia Bảo",
        "major": "Kỹ thuật máy tính",
        "year": 4,
        "address": {
          "street": "234 Trường Chinh",
          "city": "Đà Nẵng",
          "country": "Việt Nam"
        }
    }); 
    } 
    else if (id == '106220259') {
      return jsonEncode({
        "id": "106220259",
        "name": "Nguyễn Phan Hiếu Minh",
        "major": "Kỹ thuật máy tính",
        "year": 4,
        "address": {
          "street": "123 Mai Chí Công",
          "city": "Đà Nẵng",
          "country": "Việt Nam"
        }
    });
    } 
    else {
      // Mô phỏng response 404
      throw Exception('Không tìm thấy sinh viên này');
    }
  }
}
