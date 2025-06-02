import 'package:dartz/dartz.dart';
import 'package:user_management_app/core/error/failures.dart';
import 'package:user_management_app/domain/entities/user.dart';
import 'package:user_management_app/domain/repositories/user_repository.dart';

class SearchUsers {
  final UserRepository repository;

  SearchUsers(this.repository);

  Future<Either<Failure, List<User>>> call(String query) async {
    return await repository.searchUsers(query);
  }
} 