import 'package:flutter/material.dart';

class LikedProvider extends ChangeNotifier {
  List<String> _likedRecepies = [];

  List<String> get likedRecipes => _likedRecepies;

  void addRecipe(String recipeId) {
    _likedRecepies.add(recipeId);
    notifyListeners();
  }

  void removeRecipe(String recipeId) {
    _likedRecepies.remove(recipeId);
    notifyListeners();
  }

  bool isLiked(String recipeId) {
    return _likedRecepies.contains(recipeId);
  }
}
