// todo model --> props: id -> int, description -> string, isCompleted -> boolean //

class ToDo {
  final int id;
  final String text;
  final bool isCompleted;

  ToDo({
    required this.id,
    required this.text,
    this.isCompleted = false,
  });

  ToDo toggleCompletion() {
    return ToDo(
      id: id,
      text: text,
      isCompleted: !isCompleted,
    );
  }
}
