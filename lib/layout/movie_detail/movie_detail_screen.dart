import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_products/core/base/base_state.dart';
import 'package:my_products/model/response/movies_response.dart';
import 'package:my_products/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';

import '../../initial/locale/localizations.dart';
import '../state_widgets/loading_list.dart';
import 'components/detail_buttons.dart';
import 'components/first_body_detail.dart';
import 'components/header_detail.dart';
import 'components/second_body_detail.dart';
import 'movie_detail_provider.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> with BaseState {

  final ref = MovieDetailProvider();

  @override
  void afterFirstLayout(BuildContext context) {
    ref.getMovieDetail(context, widget.movie);
    ref.getVideos(context, widget.movie);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: CustomAppBar(context, lang(context).movieDetail ?? "Movie Detail"),
        body: ref.isLoading
            ? const LoadingList()
            : RefreshIndicator(
                onRefresh: () async {},
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HeaderDetail(ref: ref),
                              FirstBodyDetail(ref: ref),
                              SecondBodyDetail(ref: ref)
                            ],
                          ),
                        ),
                      ),
                    ),
                    DetailButtons(ref: ref, movie: widget.movie,)
                  ],
                ),
              ),
      );
    });
  }
}





