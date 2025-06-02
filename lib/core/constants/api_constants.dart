class ApiConstants {
  static const String baseUrl = 'https://dummyjson.com';
  static const String users = '/users';
  static const String searchUsers = '/users/search';
  static const String posts = '/posts';
  static const String todos = '/todos';
  
  // Query parameters
  static const String limitParam = 'limit';
  static const String skipParam = 'skip';
  static const String queryParam = 'q';
  
  // Default values
  static const int defaultLimit = 10;
  static const int defaultSkip = 0;
  
  // Endpoints
  static String getUsersUrl({int limit = defaultLimit, int skip = defaultSkip}) {
    return '$baseUrl$users?$limitParam=$limit&$skipParam=$skip';
  }
  
  static String getSearchUsersUrl(String query) {
    return '$baseUrl$searchUsers?$queryParam=$query';
  }
  
  static String getUserPostsUrl(int userId) {
    return '$baseUrl$posts/user/$userId';
  }
  
  static String getUserTodosUrl(int userId) {
    return '$baseUrl$todos/user/$userId';
  }
}