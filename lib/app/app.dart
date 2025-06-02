import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/bloc/theme/theme_bloc.dart';
import '../presentation/bloc/theme/theme_state.dart';
import '../presentation/bloc/user/user_bloc.dart';
import '../presentation/bloc/post/post_bloc.dart';
import '../presentation/pages/user_list_page.dart';
import '../injection_container.dart' as di;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (_) => di.sl<ThemeBloc>(),
        ),
        BlocProvider<UserBloc>(
          create: (_) => di.sl<UserBloc>(),
        ),
        BlocProvider<PostBloc>(
          create: (_) => di.sl<PostBloc>(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'User Management App',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: const UserListPage(),
          );
        },
      ),
    );
  }
}