import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_constants.dart';

class ApiService {
  // General get request method to fetch data from the API
  Future<Map<String, dynamic>> getRequest(String endpoint) async {
    final url = Uri.parse('${ApiConstants.baseUrl}$endpoint');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Get meal by name
  Future<List<dynamic>> searchMealByName(String mealName) async {
    final data = await getRequest('${ApiConstants.searchMeal}$mealName');
    return data['meals'] ?? [];
  }

  // Get meal details by ID
  Future<Map<String, dynamic>?> getMealDetails(String id) async {
    final data = await getRequest('${ApiConstants.mealDetails}$id');
    return data['meals'] != null ? data['meals'][0] : null;
  }

  // Get random meal
  Future<Map<String, dynamic>?> getRandomMeal() async {
    final data = await getRequest(ApiConstants.randomMeal);
    print(data);
    return data['meals'] != null ? data['meals'][0] : null;
  }

  // Get categories
  Future<List<dynamic>> getCategories() async {
    final data = await getRequest(ApiConstants.categories);
    return data['categories'] ?? [];
  }

  // Filter meals by ingredient
  Future<List<dynamic>> filterByIngredient(String ingredient) async {
    final data =
        await getRequest('${ApiConstants.filterByIngredient}$ingredient');
    return data['meals'] ?? [];
  }
}
