import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_products/core/base/base_state.dart';
import 'package:my_products/core/constraint/asset_path.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/core/routing/routes.dart';
import 'package:my_products/layout/dialog/search_dialog.dart';
import 'package:my_products/layout/movies/movies_provider.dart';
import 'package:my_products/layout/state_widgets/empty_state.dart';
import 'package:my_products/layout/state_widgets/loading_list.dart';
import 'package:my_products/widgets/custom_app_bar.dart';
import 'package:my_products/widgets/custom_icon_button.dart';
import 'package:my_products/widgets/custom_text.dart';

import '../state_widgets/no_connection_state.dart';
import 'adapter/movie_adapter.dart';
import 'components/movie_drawer.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> with BaseState {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final ref = MoviesProvider();

  @override
  void afterFirstLayout(BuildContext context) {
    ref.listenerMovies(context);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        key: scaffoldKey,
        appBar: CustomAppBar(
            context, context.getTitleBar(ref.currPage) ?? "MoviEnjoy",
            isBack: false, onOpenDrawer: () {
          scaffoldKey.currentState?.openDrawer();
        }, actions: [
          CustomIconButton(
              iconData: "${AssetPath.vector}search.svg",
              height: 30,
              width: 30,
              defaultColor: false,
              color: context.getColorScheme().primary,
              onPressed: () async {
                String? keyword = await showDialog(
                    context: context,
                    builder: (context) {
                      return const SearchDialog();
                    });
                if (keyword != null) {
                  if (keyword.isNotEmpty) {
                    ref.keyword = keyword;
                    ref.listenerMovies(context);
                  }
                }
              }),
          CustomIconButton(
              iconData: "${AssetPath.vector}settings.svg",
              height: 30,
              width: 30,
              defaultColor: false,
              color: context.getColorScheme().primary,
              onPressed: () async {
                ref.stopLoad();
                ref.routing.move(Routes.settings);
              }),
        ]),
        drawer: MovieDrawer(
          ref: ref,
        ),
        body: ref.noInternet ? const NoConnecttionState() :ref.isLoading
            ? const LoadingList()
            : RefreshIndicator(
                onRefresh: () async {
                  ref.keyword = "";
                  ref.listenerMovies(context);
                },
                child: CustomScrollView(
                  slivers: [
                    StreamBuilder(
                        stream: ref.movieItems,
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return SliverToBoxAdapter(
                                child: Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(top: context.getHeight() * 0.45),
                              child: CustomText(
                                textToDisplay: snapshot.error.toString(), textStyle: context.getTextTheme().bodyLarge,),
                            ));
                          } else if (snapshot.hasData) {
                            final data = snapshot.data;
                            if (data != null) {
                              if(ref.isEmpty){
                                return const SliverToBoxAdapter(
                                    child: EmptyState());
                              }

                              return SliverGrid(
                                gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio:
                                    ((context.getWidth() / 2) - 8) /
                                        (context.getHeight() * 0.5)),
                                delegate: SliverChildBuilderDelegate(
                                      (BuildContext context, int index) {
                                    return MovieCard(
                                      movie: snapshot.data![index],
                                      position: index,
                                      ref: ref,
                                    );
                                  },
                                  childCount: snapshot.data?.length,
                                ),
                              );

                            } else {
                              if(ref.isEmpty){
                                return const SliverToBoxAdapter(
                                    child: EmptyState());
                              }else{
                                return const SliverToBoxAdapter(
                                    child: SizedBox.shrink());
                              }
                            }
                          } else {
                            if(ref.isEmpty){
                              return const SliverToBoxAdapter(
                                  child: EmptyState());
                            }else{
                              return const SliverToBoxAdapter(
                                  child: SizedBox.shrink());
                            }
                          }
                        }),
                  ],
                ),
              ),
      );
    });
  }

  @override
  void dispose() {
    ref.dispose();
    super.dispose();
  }
}
