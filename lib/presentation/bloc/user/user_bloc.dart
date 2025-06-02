import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'user_event.dart' as user_event;
import 'user_state.dart';

class UserBloc extends Bloc<user_event.UserEvent, UserState> {
  final http.Client httpClient;
  static const String _baseUrl = 'https://dummyjson.com';
  static const int _limit = 10;
  int _skip = 0;
  bool _hasReachedMax = false;
  List<Map<String, dynamic>> _currentUsers = [];

  UserBloc({http.Client? httpClient})
      : httpClient = httpClient ?? http.Client(),
        super(UserInitial()) {
    on<user_event.LoadUsers>(_onLoadUsers);
    on<user_event.SearchUsers>(_onSearchUsers);
    on<user_event.LoadMoreUsers>(_onLoadMoreUsers);
  }

  Future<void> _onLoadUsers(user_event.LoadUsers event, Emitter<UserState> emit) async {
    if (event.refresh) {
      _skip = 0;
      _hasReachedMax = false;
      _currentUsers = [];
    }
    
    if (_hasReachedMax && !event.refresh) return;

    if (_skip == 0) {
      emit(UserLoading());
    }

    try {
      final response = await httpClient.get(
        Uri.parse('$_baseUrl/users?limit=$_limit&skip=$_skip'),
      );
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> usersJson = data['users'] as List<dynamic>;
        final int total = data['total'] as int;
        
        final List<Map<String, dynamic>> users = usersJson
            .map((user) => Map<String, dynamic>.from(user))
            .toList();

        _hasReachedMax = _currentUsers.length + users.length >= total;
        _currentUsers.addAll(users);
        _skip += _limit;

        emit(UserLoaded(
          users: List.from(_currentUsers),
          hasReachedMax: _hasReachedMax,
        ));
      } else {
        emit(const UserError('Failed to load users'));
      }
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  Future<void> _onLoadMoreUsers(user_event.LoadMoreUsers event, Emitter<UserState> emit) async {
    if (!_hasReachedMax) {
      add(user_event.LoadUsers(refresh: false));
    }
  }

  Future<void> _onSearchUsers(user_event.SearchUsers event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final response = await httpClient.get(
        Uri.parse('$_baseUrl/users/search?q=${event.query}'),
      );
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> usersJson = data['users'] as List<dynamic>;
        
        final List<Map<String, dynamic>> users = usersJson
            .map((user) => Map<String, dynamic>.from(user))
            .toList();

        _currentUsers = users;
        _hasReachedMax = true;
        _skip = 0;

        emit(UserLoaded(
          users: users,
          hasReachedMax: true,
        ));
      } else {
        emit(const UserError('Failed to search users'));
      }
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    httpClient.close();
    return super.close();
  }
} 