import 'package:my_products/core/memory/hive/box_keys.dart';
import 'package:my_products/model/local/movie_data.dart';

import 'hive/boxes.dart';

class MemoryAction {
  final IMemoryAction memoryAction;

  MemoryAction(this.memoryAction);


  Future saveMovie(MovieData movie) async {
    await memoryAction.saveMovie(movie);
  }

  Future deleteMovie(MovieData movie) async {
    await memoryAction.deleteMovie(movie);
  }

  List<MovieData> getMovies() {
    return memoryAction.getMovies();
  }

}

abstract class IMemoryAction {

  Future saveMovie(MovieData movie);

  Future deleteMovie(MovieData movie);

  List<MovieData> getMovies();
}

class HiveMemoryAction implements IMemoryAction {
  @override
  Future deleteMovie(MovieData movie) async {
    final box = Boxes.getBox<MovieData>(BoxKeys.movie);
    final Map<dynamic, MovieData> map = box.toMap();
    dynamic targetKey;
    map.forEach((key, value) {
      if (value.id == movie.id) {
        targetKey = key;
      }
    });
    await box.delete(targetKey);
  }

  @override
  List<MovieData> getMovies() {
    return Boxes.getBox<MovieData>(BoxKeys.movie).values.toList();
  }

  @override
  Future saveMovie(MovieData movie) async {
    await Boxes.getBox<MovieData>(BoxKeys.movie).add(movie);
  }
}
