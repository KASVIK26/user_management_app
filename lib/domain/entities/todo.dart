import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final int id;
  final String todo;
  final bool completed;
  final int userId;

  const Todo({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  @override
  List<Object> get props => [id, todo, completed, userId];

  Todo copyWith({
    int? id,
    String? todo,
    bool? completed,
    int? userId,
  }) {
    return Todo(
      id: id ?? this.id,
      todo: todo ?? this.todo,
      completed: completed ?? this.completed,
      userId: userId ?? this.userId,
    );
  }
}
