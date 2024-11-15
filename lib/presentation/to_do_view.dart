import 'package:cubittodolist/domain/models/to_do.dart';
import 'package:cubittodolist/presentation/to_do_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ToDoView extends StatelessWidget {
  const ToDoView({super.key});

  void _showAddToDoBox(BuildContext context) {
    final toDoCubit = context.read<ToDoCubit>();
    final textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(content: TextField(controller: textController), actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => toDoCubit.addToDo(textController.text),
          child: const Text('Add'),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final toDoCubit = context.read<ToDoCubit>();

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => _showAddToDoBox(context),
        ),
        body: BlocBuilder<ToDoCubit, List<ToDo>>(builder: (context, todos) {
          return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ListTile(
                  title: Text(todo.text),
                  leading: Checkbox(
                    value: todo.isCompleted,
                    onChanged: (value) => toDoCubit.toggleCompletion(todo),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => toDoCubit.deleteToDo(todo),
                  ));
            },
          );
        }));
  }
}
