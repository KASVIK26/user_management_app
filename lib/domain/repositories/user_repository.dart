import 'package:dartz/dartz.dart';
import 'package:user_management_app/core/error/failures.dart';
import 'package:user_management_app/domain/entities/user.dart';
import 'package:user_management_app/domain/entities/post.dart';
import 'package:user_management_app/domain/entities/todo.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getUsers({int skip = 0, int limit = 10});
  Future<Either<Failure, List<User>>> searchUsers(String query);
  Future<Either<Failure, List<Post>>> getUserPosts(int userId);
  Future<Either<Failure, List<Todo>>> getUserTodos(int userId);
  Future<Either<Failure, Post>> createPost(Post post);
} 