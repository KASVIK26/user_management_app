import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_management_app/domain/usecases/get_user_todos.dart';
import 'package:user_management_app/presentation/bloc/todo/todo_event.dart';
import 'package:user_management_app/presentation/bloc/todo/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetUserTodos getUserTodos;

  TodoBloc({required this.getUserTodos}) : super(TodoInitial()) {
    on<LoadUserTodos>(_onLoadUserTodos);
    on<ToggleTodoStatus>(_onToggleTodoStatus);
  }

  Future<void> _onLoadUserTodos(
    LoadUserTodos event,
    Emitter<TodoState> emit,
  ) async {
    emit(TodoLoading());
    final result = await getUserTodos(event.userId);
    result.fold(
      (failure) => emit(TodoError(failure.toString())),
      (todos) => emit(TodoLoaded(todos)),
    );
  }

  void _onToggleTodoStatus(
    ToggleTodoStatus event,
    Emitter<TodoState> emit,
  ) {
    if (state is TodoLoaded) {
      final currentState = state as TodoLoaded;
      final updatedTodos = currentState.todos.map((todo) {
        if (todo.id == event.todoId) {
          return todo.copyWith(completed: event.completed);
        }
        return todo;
      }).toList();
      emit(TodoLoaded(updatedTodos));
    }
  }
} 