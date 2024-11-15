import 'package:cubittodolist/domain/models/to_do.dart';
import 'package:cubittodolist/domain/repository/to_do_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoCubit extends Cubit<List<ToDo>> {
  final ToDoRepo toDoRepo;

  ToDoCubit(this.toDoRepo) : super([]) {
    loadTodos();
  }

  Future<void> loadTodos() async {
    final toDoList = await toDoRepo.getTodos();

    emit(toDoList);
  }

  Future<void> addToDo(String text) async {
    final newToDo = ToDo(
      id: DateTime.now().millisecond,
      text: text,
    );

    await toDoRepo.addToDo(newToDo);

    loadTodos();
  }

  Future<void> deleteToDo(ToDo toDo) async {
    await toDoRepo.deleteToDo(toDo);

    loadTodos();
  }

  Future<void> toggleCompletion(ToDo toDo) async {
    final updatedToDo = toDo.toggleCompletion();

    await toDoRepo.updateToDo(updatedToDo);

    loadTodos();
  }
}
