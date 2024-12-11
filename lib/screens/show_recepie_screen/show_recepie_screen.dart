import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/shared/styled/styled_text.dart';

@RoutePage()
class ShowRecepieScreen extends StatelessWidget {
  const ShowRecepieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleConstants.backgroundColor,
      appBar: AppBar(
        title: const StyledHeadingText(text: "Recept"),
        backgroundColor: StyleConstants.backgroundColor,
      ),
      body: Center(
        child: Text(
          "ShowRecepie",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
