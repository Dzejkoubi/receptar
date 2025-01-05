import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/shared/styled/styled_text.dart';
import 'package:receptar/app/shared/widgets/bottom_navigation_bar.dart';
import 'package:receptar/app/shared/widgets/helper_widgets.dart';
import 'package:receptar/app/shared/widgets/styled_button.dart';
import 'package:receptar/models/recepe_model.dart';
import 'package:receptar/screens/show_recepie_screens/show_recepie_expandable_tab.dart';
import 'package:receptar/services/api_service.dart';

@RoutePage()
class RandomRecepieScreen extends StatefulWidget {
  const RandomRecepieScreen({super.key});

  @override
  State<RandomRecepieScreen> createState() => _RandomRecepieScreenState();
}

class _RandomRecepieScreenState extends State<RandomRecepieScreen> {
  bool _isLoading = false;
  bool _isError = false;

  Map<String, dynamic>? _randomMeal;

  void randomRecepieButtonPressed() {
    setState(() {
      _isLoading = true;
      _isError = false;
    });
    ApiService().getRandomMeal().then((meal) {
      setState(() {
        _randomMeal = Meal.fromJson(meal!).toMap();
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
        title: const StyledHeadingText(text: "Random recepie"),
        backgroundColor: StyleConstants.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: _isLoading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 20),
                    StyledButton(
                      text: "Cancel",
                      icon: Icons.cancel,
                      onPressed: () {
                        setState(() {
                          _isLoading = false;
                        });
                      },
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StyledButton(
                      text: "Find random recepie",
                      icon: Icons.shuffle,
                      onPressed: () {
                        randomRecepieButtonPressed();
                      },
                    ),
                    VerticalSpace(height: 20),
                    if (_randomMeal != null)
                      ShowRecepieExpandableTab(
                        id: _randomMeal!["id"],
                        name: _randomMeal!["name"],
                        category: _randomMeal!["category"],
                        area: _randomMeal!["area"],
                        steps: _randomMeal!["steps"],
                        thumbPhoto: _randomMeal!["thumbPhoto"],
                        tags: _randomMeal!["tags"],
                        youtubeLink: _randomMeal!["youtubeLink"],
                        ingredients: _randomMeal!["ingredients"],
                        measures: _randomMeal!["measures"],
                      ),
                    if (_isError)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          StyledBodyText(text: "Failed to load data"),
                          const SizedBox(height: 20),
                          StyledButton(
                            text: "Cancel",
                            icon: Icons.cancel,
                            onPressed: () {
                              setState(() {
                                _isLoading = false;
                              });
                            },
                          ),
                        ],
                      )
                  ],
                ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 2),
    );
  }
}
