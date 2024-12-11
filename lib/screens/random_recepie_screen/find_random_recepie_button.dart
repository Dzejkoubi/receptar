import 'package:flutter/material.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/shared/styled/styled_text.dart';

class FindRandomRecepieButton extends StatelessWidget {
  const FindRandomRecepieButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print("Pressed");
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: StyleConstants.primaryColor,
        shadowColor: Colors.black26,
        elevation: 10,
        padding: EdgeInsets.symmetric(
            horizontal: 32, vertical: 24), // Remove default padding
        shape: const RoundedRectangleBorder(
          borderRadius: StyleConstants.borderRadius,
        ),
      ),
      child: StyledSubHeadingText(text: "Vyhledat náhodný recept"),
    );
  }
}
