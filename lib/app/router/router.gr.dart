// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [FindRecepieScreen]
class FindRecepieRoute extends PageRouteInfo<void> {
  const FindRecepieRoute({List<PageRouteInfo>? children})
      : super(
          FindRecepieRoute.name,
          initialChildren: children,
        );

  static const String name = 'FindRecepieRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FindRecepieScreen();
    },
  );
}

/// generated route for
/// [LikedRecepiesScreen]
class LikedRecepiesRoute extends PageRouteInfo<void> {
  const LikedRecepiesRoute({List<PageRouteInfo>? children})
      : super(
          LikedRecepiesRoute.name,
          initialChildren: children,
        );

  static const String name = 'LikedRecepiesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LikedRecepiesScreen();
    },
  );
}

/// generated route for
/// [RandomRecepieScreen]
class RandomRecepieRoute extends PageRouteInfo<void> {
  const RandomRecepieRoute({List<PageRouteInfo>? children})
      : super(
          RandomRecepieRoute.name,
          initialChildren: children,
        );

  static const String name = 'RandomRecepieRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RandomRecepieScreen();
    },
  );
}

/// generated route for
/// [ShowRecepieFullScreen]
class ShowRecepieFullRoute extends PageRouteInfo<ShowRecepieFullRouteArgs> {
  ShowRecepieFullRoute({
    required String id,
    required String name,
    String? category,
    String? area,
    required List<String> steps,
    String? thumbPhoto,
    required List<String> tags,
    String? youtubeLink,
    required List<String> ingredients,
    required List<String> measures,
    List<PageRouteInfo>? children,
  }) : super(
          ShowRecepieFullRoute.name,
          args: ShowRecepieFullRouteArgs(
            id: id,
            name: name,
            category: category,
            area: area,
            steps: steps,
            thumbPhoto: thumbPhoto,
            tags: tags,
            youtubeLink: youtubeLink,
            ingredients: ingredients,
            measures: measures,
          ),
          initialChildren: children,
        );

  static const String name = 'ShowRecepieFullRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ShowRecepieFullRouteArgs>();
      return ShowRecepieFullScreen(
        id: args.id,
        name: args.name,
        category: args.category,
        area: args.area,
        steps: args.steps,
        thumbPhoto: args.thumbPhoto,
        tags: args.tags,
        youtubeLink: args.youtubeLink,
        ingredients: args.ingredients,
        measures: args.measures,
      );
    },
  );
}

class ShowRecepieFullRouteArgs {
  const ShowRecepieFullRouteArgs({
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
  });

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

  @override
  String toString() {
    return 'ShowRecepieFullRouteArgs{id: $id, name: $name, category: $category, area: $area, steps: $steps, thumbPhoto: $thumbPhoto, tags: $tags, youtubeLink: $youtubeLink, ingredients: $ingredients, measures: $measures}';
  }
}

/// generated route for
/// [WelcomeScreen]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WelcomeScreen();
    },
  );
}
