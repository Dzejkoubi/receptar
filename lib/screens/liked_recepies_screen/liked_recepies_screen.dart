import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/shared/styled/styled_text.dart';
import 'package:receptar/app/shared/widgets/bottom_navigation_bar.dart';
import 'package:receptar/screens/show_recepie_screens/show_recepie_largetab.dart';
import 'package:receptar/screens/show_recepie_screens/show_recepie_smalltab.dart';

@RoutePage()
class LikedRecepiesScreen extends StatelessWidget {
  const LikedRecepiesScreen({super.key});

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
              ShowRecepieSmalltab(),
              ShowRecepieLargetab(),
            ],
          )),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
    );
  }
}
