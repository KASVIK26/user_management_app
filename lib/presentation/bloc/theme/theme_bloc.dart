import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme_state.dart';

class ThemeBloc extends Cubit<ThemeState> {
  final SharedPreferences sharedPreferences;
  static const String _themeKey = 'isDarkMode';

  ThemeBloc(this.sharedPreferences) : super(ThemeState(
    isDarkMode: sharedPreferences.getBool(_themeKey) ?? false,
  ));

  void toggleTheme() {
    final newThemeMode = !state.isDarkMode;
    sharedPreferences.setBool(_themeKey, newThemeMode);
    emit(state.copyWith(isDarkMode: newThemeMode));
  }
} 