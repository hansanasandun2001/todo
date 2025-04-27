import 'package:flutter/material.dart';
import '../models/todo_item.dart';

class TodoListItem extends StatelessWidget {
  final TodoItem item;
  final Function(String) onToggle;
  final Function(String) onDelete;

  const TodoListItem({
    Key? key,
    required this.item,
    required this.onToggle,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20.0),
        color: Colors.red,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) => onDelete(item.id),
      child: ListTile(
        leading: Checkbox(
          value: item.isCompleted,
          onChanged: (_) => onToggle(item.id),
        ),
        title: Text(
          item.title,
          style: TextStyle(
            fontSize: 16,
            decoration: item.isCompleted ? TextDecoration.lineThrough : null,
            color: item.isCompleted ? Colors.grey : Colors.black,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () => onDelete(item.id),
        ),
      ),
    );
  }
}