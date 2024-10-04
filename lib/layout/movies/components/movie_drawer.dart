import 'package:flutter/material.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/core/routing/routing.dart';

import '../../../core/constraint/asset_path.dart';
import '../../../core/constraint/enum.dart';
import '../../../core/constraint/spacer.dart';
import '../../../initial/locale/localizations.dart';
import '../../../widgets/custom_gesture.dart';
import '../../../widgets/custom_text.dart';
import '../movies_provider.dart';

class MovieDrawer extends StatelessWidget {
  final MoviesProvider ref;

  const MovieDrawer({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [buildHeader(context), buildMenuItems(context, ref)],
        ),
      ),
    );
  }
}

Widget buildHeader(BuildContext context) => Container(
  padding: const EdgeInsets.only(left: 10, bottom: 6),
  height: context.getHeight() * 0.2,
  decoration: const BoxDecoration(
    gradient: LinearGradient(colors: [
      Color(0xff854DB6),
      Color(0xff10BCAB),
      Color(0xff4A0069),
    ], begin: Alignment.bottomRight, end: Alignment.topLeft),
  ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const CircleAvatar(
        backgroundImage: AssetImage("${AssetPath.image}icon_app.png"),
      ),
      CustomText(
        textToDisplay: lang(context).appTitle ?? "MoviEnjoy",
        textStyle: context.getTextTheme().titleSmall?.copyWith(color: context.getColorScheme().outline),
      ),
      CustomText(
        textToDisplay: "Hariyanto Lukman",
        textStyle: context.getTextTheme().bodyMedium?.copyWith(color: context.getColorScheme().outline),
      ),
    ],
  ),
);

Widget buildMenuItems(BuildContext context, MoviesProvider ref) => Container(
  margin: const EdgeInsets.only(top: 20),
  child: Wrap(
    children: [
      movieDrawerMenu(context, '${AssetPath.image}now_playing.png', lang(context).nowPlaying ?? "Now Playing", () async {
        ref.currPage = MoviePage.nowPlaying;
        ref.keyword = "";
        "hit getMovies 4".logger();
        ref.listenerMovies(context);
        await Future.delayed(const Duration(milliseconds: 500));
        Navigator.pop(Routing.navigatorKey.currentContext ?? context);
      }),
      movieDrawerMenu(context, '${AssetPath.image}popular.png', lang(context).popular ?? "Popular", () async {
        ref.currPage = MoviePage.popular;
        ref.keyword = "";
        "hit getMovies 3".logger();
        ref.listenerMovies(context);
        await Future.delayed(const Duration(milliseconds: 500));
        Navigator.pop(Routing.navigatorKey.currentContext ?? context);
      }),
      movieDrawerMenu(context, '${AssetPath.image}upcoming.png', lang(context).upcoming ?? "Upcoming", () async {
        ref.currPage = MoviePage.upcoming;
        ref.keyword = "";
        "hit getMovies 2".logger();
        ref.listenerMovies(context);
        await Future.delayed(const Duration(milliseconds: 500));
        Navigator.pop(Routing.navigatorKey.currentContext ?? context);
      }),
      movieDrawerMenu(context, '${AssetPath.image}star.png', lang(context).topRated ?? "Top Rated", () async {
        ref.currPage = MoviePage.topRated;
        ref.keyword = "";
        "hit getMovies 1".logger();
        ref.listenerMovies(context);
        await Future.delayed(const Duration(milliseconds: 500));
        Navigator.pop(Routing.navigatorKey.currentContext ?? context);
      }),
      movieDrawerMenu(context, '${AssetPath.image}bookmark.png', lang(context).bookmarks ?? "Bookmarks", () async {
        ref.currPage = MoviePage.bookmarks;
        ref.listenerMovies(context);
        await Future.delayed(const Duration(milliseconds: 500));
        Navigator.pop(Routing.navigatorKey.currentContext ?? context);
      }),
    ],
  ),
);

Widget movieDrawerMenu(BuildContext context, String path, String title, Function() onTap){
  return CustomGesture(
    height: 60,
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            path,
            fit: BoxFit.fill,
            width: 32,
            height: 32,
          ),
          sixteenPx,
          CustomText(textToDisplay: title, textStyle: context.getTextTheme().bodyLarge,)
        ],
      ),
    ),
  );
}