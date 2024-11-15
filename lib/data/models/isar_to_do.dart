import 'package:cubittodolist/domain/models/to_do.dart';
import 'package:isar/isar.dart';

part 'isar_to_do.g.dart';

@collection
class ToDoIsar {
  Id id = Isar.autoIncrement;
  late String text;
  late bool isCompleted;

  // convett isar object into pure todo object
  ToDo toDomain() {
    return ToDo(
      id: id,
      text: text,
      isCompleted: isCompleted,
    );
  }

  static ToDoIsar fromDomain(ToDo todo) {
    return ToDoIsar()
      ..id = todo.id
      ..text = todo.text
      ..isCompleted = todo.isCompleted;
  }
}
