import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/post/post_bloc.dart';
import '../bloc/post/post_state.dart' as post_state;
import 'create_post_page.dart';

class UserDetailPage extends StatelessWidget {
  final Map<String, dynamic> user;

  const UserDetailPage({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user['name'] ?? 'User Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user['avatar'] ?? ''),
              ),
            ),
            const SizedBox(height: 16),
            _buildInfoCard('Name', user['name'] ?? ''),
            _buildInfoCard('Email', user['email'] ?? ''),
            _buildInfoCard('Phone', user['phone'] ?? ''),
            _buildInfoCard('Website', user['website'] ?? ''),
            _buildInfoCard('Company', user['company']?['name'] ?? ''),
            const SizedBox(height: 24),
            const Text(
              'Posts',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            BlocBuilder<PostBloc, post_state.PostState>(
              builder: (context, state) {
                if (state is post_state.PostLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is post_state.PostLoaded) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.posts.length,
                    itemBuilder: (context, index) {
                      final post = state.posts[index];
                      return Card(
                        child: ListTile(
                          title: Text(post['title'] ?? ''),
                          subtitle: Text(post['body'] ?? ''),
                        ),
                      );
                    },
                  );
                } else if (state is post_state.PostError) {
                  return Center(child: Text(state.message));
                }
                return const Center(child: Text('No posts found'));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreatePostPage(userId: user['id'].toString()),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildInfoCard(String label, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(value),
          ],
        ),
      ),
    );
  }
} 