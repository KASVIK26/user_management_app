import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object?> get props => [];
}

class LoadPosts extends PostEvent {
  final String userId;
  const LoadPosts(this.userId);

  @override
  List<Object?> get props => [userId];
}

class CreatePost extends PostEvent {
  final String userId;
  final String title;
  final String body;

  const CreatePost({
    required this.userId,
    required this.title,
    required this.body,
  });

  @override
  List<Object?> get props => [userId, title, body];
} 