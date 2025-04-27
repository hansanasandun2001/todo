import 'package:flutter/material.dart';

class AddTodoDialog extends StatefulWidget {
  final Function(String) onAddTodo;

  const AddTodoDialog({
    Key? key,
    required this.onAddTodo,
  }) : super(key: key);

  @override
  _AddTodoDialogState createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  final _textController = TextEditingController();
  String _errorText = '';

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _submitTodo() {
    final text = _textController.text.trim();
    if (text.isEmpty) {
      setState(() {
        _errorText = 'Task cannot be empty';
      });
      return;
    }

    widget.onAddTodo(text);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Task'),
      content: TextField(
        controller: _textController,
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'Enter your task',
          errorText: _errorText.isNotEmpty ? _errorText : null,
        ),
        onChanged: (_) {
          if (_errorText.isNotEmpty) {
            setState(() {
              _errorText = '';
            });
          }
        },
        onSubmitted: (_) => _submitTodo(),
      ),
      actions: [
        TextButton(
          child: const Text('CANCEL'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: const Text('ADD'),
          onPressed: _submitTodo,
        ),
      ],
    );
  }
}