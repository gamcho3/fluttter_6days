class TodoModel {
  final String title;
  bool isDone;

  TodoModel({required this.title, this.isDone = false});

  void copyWith({bool? isDone}) {
    this.isDone = isDone ?? this.isDone;
  }
}
