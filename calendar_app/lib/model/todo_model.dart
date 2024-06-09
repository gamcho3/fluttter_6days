class Todo {
  final int id;
  final String title;
  final String date;
  final String? content;
  final DateTime createdAt;

  Todo(
      {required this.id,
      required this.title,
      required this.date,
      this.content,
      required this.createdAt});

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, content: $content, createdAt: $createdAt}';
  }
}
