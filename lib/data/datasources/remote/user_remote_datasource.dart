import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:user_management_app/core/constants/api_constants.dart';
import 'package:user_management_app/core/error/exceptions.dart';
import 'package:user_management_app/data/models/user_model.dart';
import 'package:user_management_app/data/models/post_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers({int skip = 0, int limit = 10});
  Future<List<UserModel>> searchUsers(String query);
  Future<List<PostModel>> getUserPosts(int userId);
  Future<PostModel> createPost(PostModel post);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<List<UserModel>> getUsers({int skip = 0, int limit = 10}) async {
    final response = await client.get(
      Uri.parse(ApiConstants.getUsersUrl(skip: skip, limit: limit)),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body)['users'];
      return jsonList.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw ServerException(message: 'Failed to load users');
    }
  }

  @override
  Future<List<UserModel>> searchUsers(String query) async {
    final response = await client.get(
      Uri.parse(ApiConstants.getSearchUsersUrl(query)),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body)['users'];
      return jsonList.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw ServerException(message: 'Failed to search users');
    }
  }

  @override
  Future<List<PostModel>> getUserPosts(int userId) async {
    final response = await client.get(
      Uri.parse(ApiConstants.getUserPostsUrl(userId)),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body)['posts'];
      return jsonList.map((json) => PostModel.fromJson(json)).toList();
    } else {
      throw ServerException(message: 'Failed to load user posts');
    }
  }

  @override
  Future<PostModel> createPost(PostModel post) async {
    final response = await client.post(
      Uri.parse(ApiConstants.posts),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(post.toJson()),
    );

    if (response.statusCode == 201) {
      return PostModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(message: 'Failed to create post');
    }
  }
} 