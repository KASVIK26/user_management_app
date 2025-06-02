import 'package:flutter/material.dart';
import '../../presentation/pages/user_list_page.dart';
import '../../presentation/pages/user_detail_page.dart';
import '../../presentation/pages/create_post_page.dart';

class AppRoutes {
  static const String userList = '/';
  static const String userDetail = '/user-detail';
  static const String createPost = '/create-post';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case userList:
        return MaterialPageRoute(builder: (_) => const UserListPage());
      
      case userDetail:
        final user = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => UserDetailPage(user: user),
        );
      
      case createPost:
        final userId = (settings.arguments as int).toString();
        return MaterialPageRoute(
          builder: (_) => CreatePostPage(userId: userId),
        );
      
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}