import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/shared/styled/styled_text.dart';
import 'package:receptar/app/shared/widgets/bottom_navigation_bar.dart';
import 'package:receptar/app/shared/widgets/styled_button.dart';
import 'package:receptar/services/api_service.dart';

@RoutePage()
class RandomRecepieScreen extends StatefulWidget {
  const RandomRecepieScreen({super.key});

  @override
  State<RandomRecepieScreen> createState() => _RandomRecepieScreenState();
}

class _RandomRecepieScreenState extends State<RandomRecepieScreen> {
  final ApiService _apiService = ApiService();

  Map<String, dynamic>? meal;
  bool isLoading = false;
  bool hasError = false;

  Future<void> _fetchRandomMeal() async {
    setState(() {
      isLoading = true;
      hasError = false;
    });

    try {
      final result = await _apiService.getRandomMeal();
      if (result != null) {
        setState(() {
          meal = result;
        });
      }
    } catch (e) {
      setState(() {
        hasError = true;
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleConstants.backgroundColor,
      appBar: AppBar(
        title: const StyledHeadingText(text: "Random recepie"),
        backgroundColor: StyleConstants.backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledButton(
                text: "Find random recepie",
                icon: Icons.shuffle,
                onPressed: () {
                  _fetchRandomMeal();
                  print(meal?["tags"]);
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 2),
    );
  }
}
