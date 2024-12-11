import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/shared/widgets/bottom_navigation_bar.dart';

@RoutePage()
class LikedRecepiesScreen extends StatelessWidget {
  const LikedRecepiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleConstants.backgroundColor,
      appBar: AppBar(
        backgroundColor: StyleConstants.backgroundColor,
        title: const Text("LikedRecepies"),
      ),
      body: Center(
        child: Text(
          "LikedRecepies",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
    );
  }
}
