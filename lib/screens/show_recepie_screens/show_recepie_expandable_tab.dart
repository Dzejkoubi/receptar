import 'package:flutter/material.dart';
import 'package:receptar/screens/show_recepie_screens/show_recepie_largetab.dart';
import 'package:receptar/screens/show_recepie_screens/show_recepie_smalltab.dart';

class ShowRecepieExpandableTab extends StatefulWidget {
  final String id;
  final String name;
  final String? category;
  final String? area;
  final List<String> steps;
  final String? thumbPhoto;
  final List<String> tags;
  final String? youtubeLink;
  final List<String> ingredients;
  final List<String> measures;

  const ShowRecepieExpandableTab({
    required this.id,
    required this.name,
    this.category,
    this.area,
    required this.steps,
    this.thumbPhoto,
    required this.tags,
    this.youtubeLink,
    required this.ingredients,
    required this.measures,
    super.key,
  });

  @override
  State<ShowRecepieExpandableTab> createState() =>
      _ShowRecepieExpandableTabState();
}

class _ShowRecepieExpandableTabState extends State<ShowRecepieExpandableTab> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 300),
      firstChild: ShowRecepieSmallTab(
        id: widget.id,
        name: widget.name,
        category: widget.category,
        area: widget.area,
        steps: widget.steps,
        thumbPhoto: widget.thumbPhoto,
        tags: widget.tags,
        youtubeLink: widget.youtubeLink,
        ingredients: widget.ingredients,
        measures: widget.measures,

        // When small is tapped to expand
        onExpand: () {
          setState(() {
            isExpanded = true;
          });
        },
      ),
      secondChild: ShowRecepieLargeTab(
        id: widget.id,
        name: widget.name,
        category: widget.category,
        area: widget.area,
        steps: widget.steps,
        thumbPhoto: widget.thumbPhoto,
        tags: widget.tags,
        youtubeLink: widget.youtubeLink,
        ingredients: widget.ingredients,
        measures: widget.measures,

        // When large is tapped to collapse
        onCollapse: () {
          setState(() {
            isExpanded = false;
          });
        },
      ),

      // Decide which child to show
      crossFadeState:
          isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
    );
  }
}
