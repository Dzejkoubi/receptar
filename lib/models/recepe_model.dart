class Meal {
  final String id;
  final String name;
  final String? category;
  final String? area;
  final List<String> steps;
  final String? thumbPhoto;
  final List<String> tags;
  final String? youtubeLink;
  final List<String> ingredients;
  final List<String> measures;

  // Constructor
  Meal({
    required this.id,
    required this.name,
    this.category,
    this.area,
    required this.steps,
    this.thumbPhoto,
    required this.tags,
    this.youtubeLink,
    required this.ingredients,
    required this.measures,
  });

  // Factory constructor to parse JSON into Meal object
  factory Meal.fromJson(Map<String, dynamic> json) {
    //List for ingredients and measures - first ingredient has its measure at the same index
    List<String> ingredients = [];
    List<String> measures = [];
    // Each meal has up to 20 ingredients and measures

    //If ingredient is not null or empty, add it to the list but when the measure of the same index is null, add an empty string - measure is optional
    for (int i = 1; i <= 20; i++) {
      String? ingredient = json['strIngredient$i'];
      String? measure = json['strMeasure$i'];

      if (ingredient != null && ingredient.isNotEmpty) {
        ingredients.add(ingredient);
        measures.add(measure ?? '');
      }
    }

    // Convert tags from comma-separated string to List
    List<String> tags = [];
    if (json['strTags'] != null) {
      tags = json['strTags'].split(','); // Split tags by comma
    }

    List<String> steps = json['strInstructions'].split('\r\n');

    return Meal(
      id: json['idMeal'],
      name: json['strMeal'],
      category: json['strCategory'],
      area: json['strArea'],
      steps: steps,
      thumbPhoto: json['strMealThumb'],
      tags: tags,
      youtubeLink: json['strYoutube'],
      ingredients: ingredients,
      measures: measures,
    );
  }

  // Convert Meal object to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'area': area,
      'steps': steps,
      'thumbPhoto': thumbPhoto,
      'tags': tags,
      'youtubeLink': youtubeLink,
      'ingredients': ingredients,
      'measures': measures,
    };
  }
}
