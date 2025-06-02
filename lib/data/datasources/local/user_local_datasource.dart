import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_management_app/core/error/exceptions.dart';
import 'package:user_management_app/data/models/user_model.dart';

abstract class UserLocalDataSource {
  Future<void> cacheUsers(List<UserModel> users);
  Future<List<UserModel>> getLastUsers();
  Future<void> clearCache();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String CACHED_USERS_KEY = 'CACHED_USERS';

  UserLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheUsers(List<UserModel> users) async {
    final jsonString = json.encode(users.map((user) => user.toJson()).toList());
    await sharedPreferences.setString(CACHED_USERS_KEY, jsonString);
  }

  @override
  Future<List<UserModel>> getLastUsers() async {
    final jsonString = sharedPreferences.getString(CACHED_USERS_KEY);
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw CacheException(message: 'No cached users found');
    }
  }

  @override
  Future<void> clearCache() async {
    await sharedPreferences.remove(CACHED_USERS_KEY);
  }
} 