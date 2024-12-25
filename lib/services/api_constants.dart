class ApiConstants {
  // Base URL for the API
  static const String baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  // Endpoints
  static const String searchMeal = '/search.php?s=';
  static const String mealDetails = '/lookup.php?i=';
  static const String randomMeal = '/random.php';
  static const String categories = '/categories.php';
  static const String filterByIngredient = '/filter.php?i=';
  static const String filterByCategory = '/filter.php?c=';
  static const String filterByArea = '/filter.php?a=';
}
