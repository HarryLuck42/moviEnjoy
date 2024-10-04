import 'package:my_products/initial/provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Multiproviders{
  static List<SingleChildWidget> inject({required AppProvider rootNotifier}) => [
    ChangeNotifierProvider.value(value: rootNotifier),
  ];
}