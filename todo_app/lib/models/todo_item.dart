class TodoItem {
  final String id;
  final String title;
  final bool isCompleted;

  const TodoItem({
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  TodoItem copyWith({
    String? id,
    String? title,
    bool? isCompleted,
  }) {
    return TodoItem(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}