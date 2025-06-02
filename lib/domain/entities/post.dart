import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int id;
  final String title;
  final String body;
  final int userId;
  final List<String> tags;
  final int reactions;
  final int views;
  final bool isLocal; // To distinguish between API posts and locally created ones

  const Post({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
    this.tags = const [],
    this.reactions = 0,
    this.views = 0,
    this.isLocal = false,
  });

  @override
  List<Object> get props => [
        id,
        title,
        body,
        userId,
        tags,
        reactions,
        views,
        isLocal,
      ];

  Post copyWith({
    int? id,
    String? title,
    String? body,
    int? userId,
    List<String>? tags,
    int? reactions,
    int? views,
    bool? isLocal,
  }) {
    return Post(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      userId: userId ?? this.userId,
      tags: tags ?? this.tags,
      reactions: reactions ?? this.reactions,
      views: views ?? this.views,
      isLocal: isLocal ?? this.isLocal,
    );
  }
}