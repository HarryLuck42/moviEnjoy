import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_products/core/base/base_state.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/initial/locale/localizations.dart';
import 'package:my_products/layout/movie_review/adapter/movie_review_adapter.dart';
import 'package:my_products/layout/movie_review/movie_review_provider.dart';
import 'package:my_products/layout/state_widgets/no_connection_state.dart';
import 'package:my_products/widgets/custom_app_bar.dart';

import '../../model/response/movies_response.dart';
import '../../widgets/custom_text.dart';
import '../state_widgets/empty_state.dart';
import '../state_widgets/loading_list.dart';

class MovieReviewScreen extends StatefulWidget {
  final Movie movie;

  const MovieReviewScreen({super.key, required this.movie});

  @override
  State<MovieReviewScreen> createState() => _MovieReviewScreenState();
}

class _MovieReviewScreenState extends State<MovieReviewScreen> with BaseState {

  final ref = MovieReviewProvider();

  @override
  void afterFirstLayout(BuildContext context) {
    ref.listenerReviews(context, widget.movie);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: CustomAppBar(
            context, lang(context).movieReviews ?? "Movie Reviews"),
        body: ref.noInternet ? const NoConnecttionState() :ref.isLoading
            ? const LoadingList()
            : RefreshIndicator(
          onRefresh: () async {
            ref.listenerReviews(context, widget.movie);
          },
          child: CustomScrollView(
            slivers: [
              StreamBuilder(
                  stream: ref.reviewItems,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return SliverToBoxAdapter(
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(
                                top: context.getHeight() * 0.45),
                            child: CustomText(
                              textToDisplay: snapshot.error.toString(),
                              textStyle: context
                                  .getTextTheme()
                                  .bodyLarge,),
                          ));
                    } else if (snapshot.hasData) {
                      final data = snapshot.data;
                      if (data != null) {
                        if(ref.isEmpty){
                          return const SliverToBoxAdapter(
                              child: EmptyState());
                        }
                        return SliverList(
                          delegate:
                          SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                              return MovieReviewAdapter(
                                review: snapshot.data![index],
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
      ),);
    });
  }
}
