import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/shared/styled/styled_text.dart';
import 'package:receptar/app/shared/widgets/bottom_navigation_bar.dart';

@RoutePage()
class FindRecepieScreen extends StatefulWidget {
  const FindRecepieScreen({super.key});

  @override
  State<FindRecepieScreen> createState() => _FindRecepieScreenState();
}

class _FindRecepieScreenState extends State<FindRecepieScreen> {
  final TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleConstants.backgroundColor,
      appBar: AppBar(
        backgroundColor: StyleConstants.backgroundColor,
        title: const StyledHeadingText(text: "Find a recipe"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: TextField(
                autofocus: true,
                controller: searchTextController,
                decoration: InputDecoration(
                  hintText: "Find a recipe",
                  hintStyle: TextStyle(
                    color: StyleConstants.secondaryTextColor,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: StyleConstants.secondaryTextColor,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: StyleConstants.secondaryTextColor,
                    ),
                    onPressed: () {
                      searchTextController.clear();
                    },
                  ),
                  filled: true,
                  fillColor: StyleConstants.primaryColor,
                  border: OutlineInputBorder(
                    borderRadius: StyleConstants.borderRadius,
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 1),
    );
  }
}
