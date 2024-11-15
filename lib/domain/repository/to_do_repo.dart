import 'package:cubittodolist/domain/models/to_do.dart';

abstract class ToDoRepo {
  // get list of ToDo
  Future<List<ToDo>> getTodos();

  Future<void> addToDo(ToDo newToDo);
  Future<void> updateToDo(ToDo updatedToDo);
  Future<void> deleteToDo(ToDo toDo);
}
