import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/shared/styled/styled_text.dart';
import 'package:receptar/app/shared/widgets/bottom_navigation_bar.dart';

@RoutePage()
class FindRecepieScreen extends StatelessWidget {
  const FindRecepieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleConstants.backgroundColor,
      appBar: AppBar(
        backgroundColor: StyleConstants.backgroundColor,
        title: const StyledHeadingText(text: "Najít recept"),
      ),
      body: Center(
        child: const StyledBodyText(text: "FindRecepie"),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 1),
    );
  }
}
