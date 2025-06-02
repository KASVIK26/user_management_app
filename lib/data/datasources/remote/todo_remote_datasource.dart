import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:user_management_app/core/constants/api_constants.dart';
import 'package:user_management_app/data/models/todo_model.dart';

abstract class TodoRemoteDataSource {
  Future<List<TodoModel>> getUserTodos(int userId);
}

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  final http.Client client;

  TodoRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TodoModel>> getUserTodos(int userId) async {
    final response = await client.get(
      Uri.parse('${ApiConstants.baseUrl}/todos/user/$userId'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body)['todos'];
      return jsonList.map((json) => TodoModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }
} 