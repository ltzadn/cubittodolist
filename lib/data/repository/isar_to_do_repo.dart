import 'package:isar/isar.dart';
import 'package:cubittodolist/data/models/isar_to_do.dart';
import 'package:cubittodolist/domain/models/to_do.dart';
import 'package:cubittodolist/domain/repository/to_do_repo.dart';

class IsarToDoRepo implements ToDoRepo {
  final Isar db;

  IsarToDoRepo(this.db);

  //get todos
  @override
  Future<List<ToDo>> getTodos() async {
    final todos = await db.toDoIsars.where().findAll();

    return todos.map((toDoIsar) => toDoIsar.toDomain()).toList();
  }

  @override
  Future<void> addToDo(ToDo newToDo) async {
    final toDoIsar = ToDoIsar.fromDomain(newToDo);
    return db.writeTxn(() => db.toDoIsars.put(toDoIsar));
  }

  @override
  Future<void> updateToDo(ToDo updatedToDo) async {
    final toDoIsar = ToDoIsar.fromDomain(updatedToDo);
    return db.writeTxn(() => db.toDoIsars.put(toDoIsar));
  }

  @override
  Future<void> deleteToDo(ToDo toDo) async {
    await db.writeTxn(() => db.toDoIsars.delete(toDo.id));
  }
}
