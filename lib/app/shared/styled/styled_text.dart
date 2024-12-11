import 'package:flutter/material.dart';
import 'package:receptar/app/const/style_constants.dart';

class StyledHeadingText extends StatelessWidget {
  const StyledHeadingText({required this.text, super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: StyleConstants.headingTextStyle,
    );
  }
}

class StyledSubHeadingText extends StatelessWidget {
  const StyledSubHeadingText({required this.text, super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: StyleConstants.headingTextStyle.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class StyledBodyTextImportant extends StatelessWidget {
  const StyledBodyTextImportant({required this.text, super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: StyleConstants.bodyTextStyle.copyWith(
          fontWeight: FontWeight.w700,
        ));
  }
}

class StyledBodyText extends StatelessWidget {
  const StyledBodyText({required this.text, super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: StyleConstants.bodyTextStyle,
    );
  }
}
