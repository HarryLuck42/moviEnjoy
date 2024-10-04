import 'package:hive/hive.dart';
import 'package:my_products/model/local/movie_data.dart';

import 'box_keys.dart';

class Boxes{

  static Box<T> getBox<T>(String key) => Hive.box(key);

  static Future<void> initialBoxes()async{
    await Hive.openBox<MovieData>(BoxKeys.movie);
  }

}