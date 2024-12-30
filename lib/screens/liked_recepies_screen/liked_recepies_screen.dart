import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/shared/styled/styled_text.dart';
import 'package:receptar/app/shared/widgets/bottom_navigation_bar.dart';
import 'package:receptar/app/shared/widgets/helper_widgets.dart';
import 'package:receptar/app/shared/widgets/styled_button.dart';
import 'package:receptar/models/recepe_model.dart';
import 'package:receptar/models/test_mode.dart';
import 'package:receptar/screens/show_recepie_screens/show_recepie_largetab.dart';
import 'package:receptar/screens/show_recepie_screens/show_recepie_smalltab.dart';

@RoutePage()
class LikedRecepiesScreen extends StatefulWidget {
  const LikedRecepiesScreen({super.key});

  @override
  State<LikedRecepiesScreen> createState() => _LikedRecepiesScreenState();
}

class _LikedRecepiesScreenState extends State<LikedRecepiesScreen> {
  final Meal testMeal = MealTest.testMeal();
  final Map testMealMap = MealTest.testMeal().toMap();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(testMealMap["imageLink"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleConstants.backgroundColor,
      appBar: AppBar(
        backgroundColor: StyleConstants.backgroundColor,
        title: const StyledHeadingText(text: "Oblíbené recepty"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowRecepieSmallTab(
                id: testMeal.id,
                name: testMeal.name,
                category: testMeal.category,
                area: testMeal.area,
                steps: testMeal.steps,
                thumbPhoto: testMeal.thumbPhoto,
                tags: testMeal.tags,
                youtubeLink: testMeal.youtubeLink,
                ingredients: testMeal.ingredients,
                measures: testMeal.measures,
              ),
              VerticalSpace(height: 16),
              ShowRecepieLargeTab(
                id: testMeal.id,
                name: testMeal.name,
                category: testMeal.category,
                area: testMeal.area,
                steps: testMeal.steps,
                thumbPhoto: testMeal.thumbPhoto,
                tags: testMeal.tags,
                youtubeLink: testMeal.youtubeLink,
                ingredients: testMeal.ingredients,
                measures: testMeal.measures,
              ),
              VerticalSpace(height: 16),
            ],
          )),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {},
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
    );
  }
}
