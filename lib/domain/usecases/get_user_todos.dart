import 'package:dartz/dartz.dart';
import 'package:user_management_app/core/error/failures.dart';
import 'package:user_management_app/domain/entities/todo.dart';
import 'package:user_management_app/domain/repositories/user_repository.dart';

class GetUserTodos {
  final UserRepository repository;

  GetUserTodos(this.repository);

  Future<Either<Failure, List<Todo>>> call(int userId) async {
    return await repository.getUserTodos(userId);
  }
} 