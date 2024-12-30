import 'package:flutter/material.dart';
import 'package:receptar/app/const/style_constants.dart';

class StyledDivider extends StatelessWidget {
  const StyledDivider({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: StyleConstants.secondaryTextColor,
    );
  }
}
