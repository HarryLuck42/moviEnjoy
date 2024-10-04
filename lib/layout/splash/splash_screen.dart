import 'package:flutter/material.dart';
import 'package:my_products/core/base/base_state.dart';
import 'package:my_products/core/constraint/asset_path.dart';
import 'package:my_products/core/constraint/spacer.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/core/routing/routing.dart';
import 'package:my_products/initial/locale/localizations.dart';
import 'package:my_products/widgets/custom_text.dart';

import '../../core/routing/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with BaseState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              '${AssetPath.image}icon_app.png',
              width: 200,
              height: 200,
            )),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), (){
      Routing().moveReplacement(Routes.movies);

    });
  }
}
