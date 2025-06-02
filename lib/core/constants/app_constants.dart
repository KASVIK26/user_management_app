class AppConstants {
  // App Info
  static const String appName = 'User Management App';
  
  // Storage Keys
  static const String cachedUsersKey = 'CACHED_USERS';
  static const String themeKey = 'THEME_MODE';
  
  // UI Constants
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  
  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);
  
  // Error Messages
  static const String networkError = 'Please check your internet connection';
  static const String serverError = 'Server error occurred';
  static const String cacheError = 'Cache error occurred';
  static const String unknownError = 'An unknown error occurred';
  
  // Success Messages
  static const String postCreatedSuccess = 'Post created successfully';
  
  // Placeholders
  static const String searchHint = 'Search users...';
  static const String noDataFound = 'No data found';
  static const String noUsersFound = 'No users found';
}