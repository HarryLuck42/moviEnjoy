import 'package:flutter/material.dart';
import 'package:my_products/app.dart';
import 'package:my_products/core/lifecycle/lifecycle_manager.dart';
import 'package:my_products/core/lifecycle/route_observer.dart';
import 'package:my_products/core/routing/routes_actions.dart';
import 'package:my_products/initial/locale/localizations.dart';
import 'package:my_products/initial/multiproviders.dart';
import 'package:my_products/initial/provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../core/routing/routing.dart';

class MyAppLayout extends StatefulWidget {
  const MyAppLayout({Key? key}) : super(key: key);

  @override
  State<MyAppLayout> createState() => _MyAppLayoutState();
}

class _MyAppLayoutState extends State<MyAppLayout> {
  final rootNotifier = AppProvider();

  @override
  void initState() {
    rootNotifier.setInitialState();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: Multiproviders.inject(rootNotifier: rootNotifier),
      child: Consumer<AppProvider>(builder: (context, ref, _){
        return LifecycleManager(
          child: MaterialApp(
            key: materialAppKey,
            title: "MoviEnjoy",
            theme: ref.themeData,
            navigatorObservers: [
              CustomRouteObserver(),
              CustomRouteObserver.routeObserver
            ],
            supportedLocales: const [
              Locale("en"),
              Locale("id")
            ],
            locale: Locale(ref.lang),
            localizationsDelegates: const [
              AppLocale.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            onGenerateInitialRoutes: RoutesActions.initialAction,
            onGenerateRoute: RoutesActions.allActions,
            debugShowCheckedModeBanner: false,
            navigatorKey: Routing.navigatorKey,
            scaffoldMessengerKey: Routing.scaffoldMessengerKey,
            builder: (context, child) => MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0), child: child ?? Container(color: Colors.white,)),
            // home: const MainScreen(),
          ),
        );
      } ,
      ),
    );
  }
}
