import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/router/router.dart';
import 'package:receptar/app/shared/styled/styled_text.dart';
import 'package:receptar/app/shared/widgets/bottom_navigation_bar.dart';
import 'package:receptar/app/shared/widgets/helper_widgets.dart';
import 'package:receptar/app/shared/widgets/styled_button.dart';
import 'package:receptar/providers/liked_provider.dart';
import 'package:receptar/screens/show_recepie_screens/show_recepie_expandable_tab.dart';
import 'package:receptar/services/api_service.dart';

@RoutePage()
class LikedRecepiesScreen extends StatefulWidget {
  const LikedRecepiesScreen({super.key});

  @override
  State<LikedRecepiesScreen> createState() => _LikedRecepiesScreenState();
}

class _LikedRecepiesScreenState extends State<LikedRecepiesScreen> {
  bool _isLoading = false;
  bool _isError = false;

  List<Map<String, dynamic>>? _mealsList;

  void loadData() {
    setState(() {
      _isLoading = true;
      _isError = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleConstants.backgroundColor,
      appBar: AppBar(
        backgroundColor: StyleConstants.backgroundColor,
        title: const StyledHeadingText(text: "Liked recepies"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: context.read<LikedProvider>().likedRecipes.isNotEmpty
              //Tady se na zaklade id receptu zkusi getnout data z API
              ? ListView.builder(
                  itemCount: context.read<LikedProvider>().likedRecipes.length,
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
                )
              : Center(
                  child: Column(
                    children: [
                      VerticalSpace(height: 16),
                      const StyledBodyTextImportant(
                        text: "You have not liked any recepies yet.",
                      ),
                      VerticalSpace(height: 16),
                      const StyledBodyTextImportant(
                        text:
                            "Go to the 'Find a recipe' or 'Random recipe' screen to find a recipe you like.",
                      ),
                      VerticalSpace(height: 16),
                      StyledButton(
                        text: "Find a recipe",
                        icon: Icons.search,
                        onPressed: () {
                          context.router.push(const FindRecepieRoute());
                        },
                      ),
                      const SizedBox(height: 20),
                      StyledButton(
                        text: "Random recipe",
                        icon: Icons.shuffle,
                        onPressed: () {
                          context.router.push(const RandomRecepieRoute());
                        },
                      ),
                    ],
                  ),
                )),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
    );
  }
}


//TODO: solve the favourite recipes feature