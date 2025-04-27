import 'package:flutter/material.dart';
import '../models/todo_item.dart';
import '../widgets/todo_list_item.dart';
import '../widgets/add_todo_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TodoItem> _todoItems = [];

  void _addTodoItem(String title) {
    setState(() {
      _todoItems.add(
        TodoItem(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          title: title,
          isCompleted: false,
        ),
      );
    });
  }

  void _toggleTodoItem(String id) {
    setState(() {
      final index = _todoItems.indexWhere((item) => item.id == id);
      if (index != -1) {
        _todoItems[index] = _todoItems[index].copyWith(
          isCompleted: !_todoItems[index].isCompleted,
        );
      }
    });
  }

  void _deleteTodoItem(String id) {
    setState(() {
      _todoItems.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Todo App'),
      ),
      body: _todoItems.isEmpty
          ? const Center(
        child: Text(
          'No tasks yet. Add some!',
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: _todoItems.length,
        itemBuilder: (context, index) {
          final item = _todoItems[index];
          return TodoListItem(
            item: item,
            onToggle: _toggleTodoItem,
            onDelete: _deleteTodoItem,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddTodoDialog(onAddTodo: _addTodoItem),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
