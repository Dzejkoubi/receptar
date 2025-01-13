import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/shared/styled/styled_text.dart';
import 'package:receptar/app/shared/widgets/bottom_navigation_bar.dart';
import 'package:receptar/app/shared/widgets/favorites_button_widget.dart';
import 'package:receptar/app/shared/widgets/helper_widgets.dart';
import 'package:receptar/app/shared/widgets/styled_button.dart';
import 'package:receptar/app/shared/widgets/styled_divider.dart';
import 'package:receptar/models/recepe_model.dart';
import 'package:receptar/providers/liked_provider.dart';
import 'package:receptar/screens/show_recepie_screens/show_recepie_expandable_tab.dart';
import 'package:receptar/services/api_service.dart';

@RoutePage()
class FindRecepieScreen extends StatefulWidget {
  const FindRecepieScreen({super.key});

  @override
  State<FindRecepieScreen> createState() => _FindRecepieScreenState();
}

class _FindRecepieScreenState extends State<FindRecepieScreen> {
  final TextEditingController _searchTextController = TextEditingController();

  bool _isLoading = false;
  bool _isError = false;

  List<Map<String, dynamic>>? _mealsList;

  void seatchButtonPressed() {
    setState(() {
      _isLoading = true;
      _isError = false;
    });
    ApiService().searchMealByName(_searchTextController.text).then((meals) {
      setState(() {
        _mealsList = meals.map((meal) => Meal.fromJson(meal).toMap()).toList();
        _isLoading = false;
      });
    }).catchError((error) {
      setState(() {
        _isLoading = false;
        _isError = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleConstants.backgroundColor,
      appBar: AppBar(
        backgroundColor: StyleConstants.backgroundColor,
        title: const StyledHeadingText(text: "Find a recipe"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      cursorColor: StyleConstants.primaryTextColor,
                      autofocus: true,
                      controller: _searchTextController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12), // Adjusted padding
                        hintText: "Find a recipe",
                        hintStyle: TextStyle(
                          color: StyleConstants.secondaryTextColor,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: StyleConstants.secondaryTextColor,
                          ),
                          onPressed: () {
                            _searchTextController.clear();
                          },
                        ),
                        filled: true,
                        fillColor: StyleConstants.primaryColor,
                        border: OutlineInputBorder(
                          borderRadius: StyleConstants.borderRadius,
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const HorizontalSpace(width: 8),
                  StyledButton(
                    text: "Search",
                    onPressed: () {
                      seatchButtonPressed();
                    },
                    icon: Icons.search,
                  ),
                ],
              ),
              StyledDivider(),
              _isLoading
                  ? const CircularProgressIndicator()
                  : _isError
                      ? const StyledBodyTextImportant(
                          text: "Error loading data",
                        )
                      : _mealsList == null
                          ? const StyledBodyTextImportant(
                              text: "No recepies found",
                            )
                          : Expanded(
                              child: ListView.builder(
                                itemCount: _mealsList!.length,
                                itemBuilder: (context, index) {
                                  final meal = _mealsList![index];
                                  return Column(
                                    children: [
                                      ShowRecepieExpandableTab(
                                        id: meal["id"],
                                        name: meal["name"],
                                        category: meal["category"],
                                        area: meal["area"],
                                        steps: meal["steps"],
                                        thumbPhoto: meal["thumbPhoto"],
                                        tags: meal["tags"],
                                        youtubeLink: meal["youtubeLink"],
                                        ingredients: meal["ingredients"],
                                        measures: meal["measures"],
                                      ),
                                      const VerticalSpace(height: 16),
                                    ],
                                  );
                                },
                              ),
                            ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0;
              i < context.read<LikedProvider>().likedRecipes.length;
              i++) {
            print(context.read<LikedProvider>().likedRecipes[i]);
          }
        },
        child: const Icon(Icons.shuffle),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 1),
    );
  }
}
