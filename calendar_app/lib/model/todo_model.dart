import 'dart:ui';

enum TodoStatus {
  work,
  personal,
  other;

  Color get color {
    switch (this) {
      case TodoStatus.work:
        return Color(0xFFE57373);
      case TodoStatus.personal:
        return Color(0xFF81C784);
      case TodoStatus.other:
        return Color(0xFF64B5F6);
    }
  }
}

class Todo {
  final int id;
  final String title;
  final String date;
  final String status;
  final String? content;
  final DateTime? createdAt;

  Todo(
      {required this.id,
      required this.title,
      required this.date,
      required this.status,
      this.content,
      this.createdAt});

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, date: $date, status: $status, content: $content, createdAt: $createdAt}';
  }
}
