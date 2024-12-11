import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/shared/styled/styled_text.dart';
import 'package:receptar/screens/random_recepie_screen/find_random_recepie_button.dart';

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: FindRandomRecepieButton(),
            )
          ],
        ));
  }
}
