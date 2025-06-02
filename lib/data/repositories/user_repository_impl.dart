import 'package:dartz/dartz.dart';
import 'package:user_management_app/core/error/exceptions.dart';
import 'package:user_management_app/core/error/failures.dart';
import 'package:user_management_app/core/network/network_info.dart';
import 'package:user_management_app/data/datasources/remote/todo_remote_datasource.dart';
import 'package:user_management_app/data/datasources/remote/user_remote_datasource.dart';
import 'package:user_management_app/domain/entities/user.dart';
import 'package:user_management_app/domain/entities/post.dart';
import 'package:user_management_app/domain/entities/todo.dart';
import 'package:user_management_app/domain/repositories/user_repository.dart';
import 'package:user_management_app/data/models/post_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final TodoRemoteDataSource todoRemoteDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.todoRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<User>>> getUsers({int skip = 0, int limit = 10}) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUsers = await remoteDataSource.getUsers(skip: skip, limit: limit);
        return Right(remoteUsers);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(NetworkFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<User>>> searchUsers(String query) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUsers = await remoteDataSource.searchUsers(query);
        return Right(remoteUsers);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(NetworkFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<Post>>> getUserPosts(int userId) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePosts = await remoteDataSource.getUserPosts(userId);
        return Right(remotePosts);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(NetworkFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<Todo>>> getUserTodos(int userId) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTodos = await todoRemoteDataSource.getUserTodos(userId);
        return Right(remoteTodos);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(NetworkFailure(message: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, Post>> createPost(Post post) async {
    if (await networkInfo.isConnected) {
      try {
        final postModel = PostModel(
          id: post.id,
          title: post.title,
          body: post.body,
          userId: post.userId,
          tags: post.tags,
          reactions: post.reactions,
          views: post.views,
          isLocal: post.isLocal,
        );
        final createdPost = await remoteDataSource.createPost(postModel);
        return Right(createdPost);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: e.message));
      }
    } else {
      return Left(NetworkFailure(message: 'No internet connection'));
    }
  }
} 