import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RandomRecepieScreen extends StatelessWidget {
  const RandomRecepieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "RandomRecepie",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
