import 'package:flutter/material.dart';
import 'models/student.dart';
import 'services/student_service.dart';

void main() {
  runApp(const StudentLookupApp());
}

class StudentLookupApp extends StatelessWidget {
  const StudentLookupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Lookup Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const StudentLookupPage(),
    );
  }
}

class StudentLookupPage extends StatefulWidget {
  const StudentLookupPage({super.key});

  @override
  State<StudentLookupPage> createState() => _StudentLookupPageState();
}

class _StudentLookupPageState extends State<StudentLookupPage> {
  final _controller = TextEditingController();
  final StudentService _service = StudentService();
  Student? _student;
  String? _error;
  bool _loading = false;

  void _search() async {
    final id = _controller.text.trim();
    if (id.isEmpty) {
      setState(() {
        _error = 'Vui lòng nhập mã số sinh viên';
        _student = null;
      });
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
      _student = null;
    });

    try {
      final student = await _service.fetchStudentById(id);
      setState(() {
        _student = student;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _resultWidget() {
    if (_loading) return const Center(child: CircularProgressIndicator());

    if (_error != null) {
      return Text(_error!, style: const TextStyle(color: Colors.red));
    }

    if (_student == null) {
      return const Text('Chưa có kết quả');
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Mã: ${_student!.id}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 6),
            Text('Tên: ${_student!.name}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text('Ngành: ${_student!.major}'),
            Text('Năm học: ${_student!.year}'),
            const SizedBox(height: 8),
            const Text('Địa chỉ:', style: TextStyle(decoration: TextDecoration.underline)),
            Text('${_student!.address.street}'),
            Text('${_student!.address.city}, ${_student!.address.country}'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tra cứu sinh viên')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Mã số sinh viên',
                hintText: 'VD: 1062202XX',
              ),
              onSubmitted: (_) => _search(),
            ),
            const SizedBox(height: 12),
            ElevatedButton(onPressed: _search, child: const Text('Tìm')),
            const SizedBox(height: 20),
            Expanded(child: SingleChildScrollView(child: _resultWidget())),
          ],
        ),
      ),
    );
  }
}
