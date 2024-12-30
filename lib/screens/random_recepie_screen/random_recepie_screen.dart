import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/shared/styled/styled_text.dart';
import 'package:receptar/app/shared/widgets/bottom_navigation_bar.dart';
import 'package:receptar/app/shared/widgets/styled_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class RandomRecepieScreen extends StatelessWidget {
  const RandomRecepieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleConstants.backgroundColor,
      appBar: AppBar(
        title: const StyledHeadingText(text: "Náhodný recept"),
        backgroundColor: StyleConstants.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledButton(
                text: "Find random recepie",
                icon: Icons.shuffle,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 2),
    );
  }
}
