import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final http.Client httpClient;
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  PostBloc({http.Client? httpClient})
      : httpClient = httpClient ?? http.Client(),
        super(PostInitial()) {
    on<LoadPosts>(_onLoadPosts);
    on<CreatePost>(_onCreatePost);
  }

  Future<void> _onLoadPosts(LoadPosts event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      final response = await httpClient.get(
        Uri.parse('$_baseUrl/posts?userId=${event.userId}'),
      );
      if (response.statusCode == 200) {
        final List<dynamic> postsJson = json.decode(response.body);
        final List<Map<String, dynamic>> posts = postsJson
            .map((post) => Map<String, dynamic>.from(post))
            .toList();
        emit(PostLoaded(posts));
      } else {
        emit(const PostError('Failed to load posts'));
      }
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }

  Future<void> _onCreatePost(CreatePost event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      final response = await httpClient.post(
        Uri.parse('$_baseUrl/posts'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'userId': event.userId,
          'title': event.title,
          'body': event.body,
        }),
      );
      if (response.statusCode == 201) {
        final post = json.decode(response.body);
        final currentState = state;
        if (currentState is PostLoaded) {
          emit(PostLoaded([...currentState.posts, post]));
        } else {
          emit(PostLoaded([post]));
        }
      } else {
        emit(const PostError('Failed to create post'));
      }
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }

  @override
  Future<void> close() {
    httpClient.close();
    return super.close();
  }
} 