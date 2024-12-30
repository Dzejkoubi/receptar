import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:receptar/app/const/style_constants.dart';
import 'package:receptar/app/shared/styled/styled_text.dart';
import 'package:receptar/app/shared/widgets/bottom_navigation_bar.dart';
import 'package:receptar/app/shared/widgets/helper_widgets.dart';
import 'package:receptar/app/shared/widgets/styled_button.dart';
import 'package:receptar/screens/show_recepie_screens/show_recepie_largetab.dart';
import 'package:receptar/screens/show_recepie_screens/show_recepie_smalltab.dart';

@RoutePage()
class LikedRecepiesScreen extends StatelessWidget {
  const LikedRecepiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleConstants.backgroundColor,
      appBar: AppBar(
        backgroundColor: StyleConstants.backgroundColor,
        title: const StyledHeadingText(text: "Oblíbené recepty"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowRecepieSmallTab(),
              VerticalSpace(height: 16),
              ShowRecepieLargeTab(),
              VerticalSpace(height: 16),
            ],
          )),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          // print(
          //     "Width: ${MediaQuery.of(context).size.width}\n Height: ${MediaQuery.of(context).size.height}");
        },
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
    );
  }
}
