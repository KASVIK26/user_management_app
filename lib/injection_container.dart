import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';

// Core
import 'core/network/network_info.dart';
import 'core/utils/debouncer.dart';

// Data
import 'data/datasources/local/user_local_datasource.dart';
import 'data/datasources/remote/user_remote_datasource.dart';
import 'data/datasources/remote/todo_remote_datasource.dart';
import 'data/repositories/user_repository_impl.dart';

// Domain
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/get_users.dart';
import 'domain/usecases/search_users.dart';
import 'domain/usecases/get_user_posts.dart';
import 'domain/usecases/get_user_todos.dart';

// Presentation
import 'presentation/bloc/user/user_bloc.dart';
import 'presentation/bloc/post/post_bloc.dart';
import 'presentation/bloc/todo/todo_bloc.dart';
import 'presentation/bloc/theme/theme_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());

  // Blocs
  sl.registerLazySingleton(() => ThemeBloc(sl()));
  sl.registerLazySingleton(() => UserBloc(httpClient: sl()));
  sl.registerLazySingleton(() => PostBloc(httpClient: sl()));
}