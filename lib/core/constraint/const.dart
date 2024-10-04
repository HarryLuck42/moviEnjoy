import 'package:my_products/core/constraint/enum.dart';


const imageUrl = "http://image.tmdb.org/t/p/w500";
const apiKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwZTQwOWMyZTI0NTMxNWUxYmMwMmM1NTI2MTc1YzQ2YSIsIm5iZiI6MTcyODAyMzQ5Ni4xODgyNzQsInN1YiI6IjY2ZmY4YThkYzlhMTBkNDZlYTdjYmUxYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.rSCxyAJGl2dkV-fHNpmf_pyIEfw9Qafz-S6FbI3jXWY";
const language = "en-US";


const moviePath = <MoviePage, String>{
  MoviePage.nowPlaying : "now_playing",
  MoviePage.popular: "popular",
  MoviePage.upcoming: "upcoming",
  MoviePage.topRated: "top_rated"
};


