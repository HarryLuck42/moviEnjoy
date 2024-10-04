import 'package:flutter/material.dart';

import '../core/constraint/sp_keys.dart';
import '../core/memory/shared/share_preference.dart';
import '../core/themes/app_theme.dart';

class AppProvider extends ChangeNotifier{
  ThemeData? _themeData;

  String? appVersion;

  ThemeData? get themeData => _themeData;

  set themeData(ThemeData? val) {
    _themeData = val;
    SharedPreference().writeStorage(SpKeys.isLightTheme, appLightTheme() == val);
    notifyListeners();
  }

  bool get isLight => SharedPreference().readStorage(SpKeys.isLightTheme) ?? true;


  void setInitialState() {
    bool themeState = SharedPreference().readStorage(SpKeys.isLightTheme) ?? true;
    _themeData = themeState ? appLightTheme() : appDarkTheme();
    _lang = SharedPreference().readStorage(SpKeys.locale) ?? "en";
  }

  String _lang = "en";
  String get lang => _lang;
  set lang(String value) {
    _lang = value;
    SharedPreference().writeStorage(SpKeys.locale, value);
    notifyListeners();
  }
}