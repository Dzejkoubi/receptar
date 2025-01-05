import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/router/router.dart';
import 'package:receptar/app/shared/styled/styled_text.dart';
import 'package:receptar/app/shared/widgets/bottom_navigation_bar.dart';
import 'package:receptar/app/shared/widgets/helper_widgets.dart';
import 'package:receptar/app/shared/widgets/styled_button.dart';
import 'package:receptar/models/recepe_model.dart';
import 'package:receptar/models/test_mode.dart';
import 'package:receptar/screens/show_recepie_screens/show_recepie_expandable_tab.dart';

@RoutePage()
class LikedRecepiesScreen extends StatefulWidget {
  const LikedRecepiesScreen({super.key});

  @override
  State<LikedRecepiesScreen> createState() => _LikedRecepiesScreenState();
}

class _LikedRecepiesScreenState extends State<LikedRecepiesScreen> {
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
          child: Center(
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
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {},
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
    );
  }
}


//TODO: solve the favourite recipes feature