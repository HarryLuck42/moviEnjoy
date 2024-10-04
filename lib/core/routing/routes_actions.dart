import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_products/core/routing/routes.dart';
import 'package:my_products/layout/movie_review/movie_review_screen.dart';
import 'package:my_products/layout/movies/movies_screen.dart';
import 'package:my_products/layout/movies/movies_screen.dart';
import 'package:my_products/layout/settings/settings_screen.dart';
import 'package:my_products/layout/splash/splash_screen.dart';
import 'package:my_products/model/response/movies_response.dart';

import '../../layout/movie_detail/movie_detail_screen.dart';

class RoutesActions{
  static List<Route<dynamic>> initialAction(_){
    return [MaterialPageRoute(builder: (_) => const SplashScreen())];
  }

  static Route<dynamic> allActions(RouteSettings settings){
    switch(settings.name){
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.movies:
        return MaterialPageRoute(builder: (_) => const MoviesScreen());
      case Routes.movieDetail:
        return MaterialPageRoute(builder: (_) => MovieDetailScreen(movie: settings.arguments as Movie));
      case Routes.movieReview:
        return MaterialPageRoute(builder: (_) => MovieReviewScreen(movie: settings.arguments as Movie));
      case Routes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
    }
    return MaterialPageRoute(builder: (_) => const SplashScreen());
  }
}

