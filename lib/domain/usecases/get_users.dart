import 'package:dartz/dartz.dart';
import 'package:user_management_app/core/error/failures.dart';
import 'package:user_management_app/domain/entities/user.dart';
import 'package:user_management_app/domain/repositories/user_repository.dart';

class GetUsers {
  final UserRepository repository;

  GetUsers(this.repository);

  Future<Either<Failure, List<User>>> call({int skip = 0, int limit = 10}) async {
    return await repository.getUsers(skip: skip, limit: limit);
  }
} 