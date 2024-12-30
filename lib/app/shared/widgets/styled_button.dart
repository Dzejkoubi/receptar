import 'package:flutter/material.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/shared/styled/styled_text.dart';

class StyledButton extends StatelessWidget {
  const StyledButton(this.text, this.icon, {super.key});

  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: StyleConstants.primaryColor,
        borderRadius: StyleConstants.borderRadius,
      ),
      child: TextButton.icon(
          style: ButtonStyle(
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: StyleConstants.borderRadius,
              ),
            ),
            overlayColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return StyleConstants.lowOpacityTextColor;
                }
                return null; // Defer to the default value.
              },
            ),
          ),
          onPressed: () {},
          icon: Icon(
            icon,
            color: StyleConstants.primaryTextColor,
          ),
          label: Padding(
            padding: const EdgeInsets.all(8.0),
            child: StyledBodyTextImportant(
              text: text,
            ),
          )),
    );
  }
}
