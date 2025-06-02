import 'package:user_management_app/domain/entities/post.dart';

class PostModel extends Post {
  const PostModel({
    required super.id,
    required super.title,
    required super.body,
    required super.userId,
    super.tags = const [],
    super.reactions = 0,
    super.views = 0,
    super.isLocal = false,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
      userId: json['userId'] as int,
      tags: (json['tags'] as List<dynamic>?)?.cast<String>() ?? [],
      reactions: json['reactions'] as int? ?? 0,
      views: json['views'] as int? ?? 0,
      isLocal: json['isLocal'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'userId': userId,
      'tags': tags,
      'reactions': reactions,
      'views': views,
      'isLocal': isLocal,
    };
  }
} 