import 'package:flutter/material.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/shared/widgets/helper_widgets.dart';

class StyledDivider extends StatelessWidget {
  const StyledDivider({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(height: 8),
        const Divider(
          color: StyleConstants.secondaryTextColor,
        ),
        VerticalSpace(height: 8),
      ],
    );
  }
}
