import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class LoadUserTodos extends TodoEvent {
  final int userId;

  const LoadUserTodos(this.userId);

  @override
  List<Object> get props => [userId];
}

class ToggleTodoStatus extends TodoEvent {
  final int todoId;
  final bool completed;

  const ToggleTodoStatus({
    required this.todoId,
    required this.completed,
  });

  @override
  List<Object> get props => [todoId, completed];
} 