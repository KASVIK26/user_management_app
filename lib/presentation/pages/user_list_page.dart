import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/theme/theme_bloc.dart';
import '../bloc/user/user_bloc.dart';
import '../bloc/user/user_event.dart' as user_event;
import '../bloc/user/user_state.dart' as user_state;
import '../utils/debouncer.dart';
import 'user_detail_page.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    context.read<UserBloc>().add(const user_event.LoadUsers(refresh: true));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<UserBloc>().add(user_event.LoadMoreUsers());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  void _onSearchChanged(String query) {
    _debouncer.run(() {
      if (query.isEmpty) {
        context.read<UserBloc>().add(const user_event.LoadUsers(refresh: true));
      } else {
        context.read<UserBloc>().add(user_event.SearchUsers(query));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              context.read<ThemeBloc>().toggleTheme();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search users...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              onChanged: _onSearchChanged,
            ),
          ),
          Expanded(
            child: BlocBuilder<UserBloc, user_state.UserState>(
              builder: (context, state) {
                if (state is user_state.UserLoading && state.users.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is user_state.UserLoaded) {
                  if (state.users.isEmpty) {
                    return const Center(child: Text('No users found'));
                  }
                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<UserBloc>().add(const user_event.LoadUsers(refresh: true));
                    },
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: state.hasReachedMax
                          ? state.users.length
                          : state.users.length + 1,
                      itemBuilder: (context, index) {
                        if (index >= state.users.length) {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        final user = state.users[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(user['image'] ?? ''),
                            ),
                            title: Text(user['firstName'] ?? ''),
                            subtitle: Text(user['email'] ?? ''),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserDetailPage(user: user),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is user_state.UserError) {
                  return Center(child: Text(state.message));
                }
                return const Center(child: Text('No users found'));
              },
            ),
          ),
        ],
      ),
    );
  }
} 