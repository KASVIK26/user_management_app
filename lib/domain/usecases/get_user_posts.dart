import 'package:dartz/dartz.dart';
import 'package:user_management_app/core/error/failures.dart';
import 'package:user_management_app/domain/entities/post.dart';
import 'package:user_management_app/domain/repositories/user_repository.dart';

class GetUserPosts {
  final UserRepository repository;

  GetUserPosts(this.repository);

  Future<Either<Failure, List<Post>>> call(int userId) async {
    return await repository.getUserPosts(userId);
  }
} 