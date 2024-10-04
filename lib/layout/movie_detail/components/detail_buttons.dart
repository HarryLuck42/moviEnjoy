import 'package:flutter/material.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/initial/locale/localizations.dart';
import 'package:my_products/layout/dialog/video_list_dialog.dart';
import 'package:my_products/layout/dialog/youtube_player_dialog.dart';

import '../../../core/constraint/spacer.dart';
import '../../../core/routing/routes.dart';
import '../../../core/routing/routing.dart';
import '../../../model/response/movies_response.dart';
import '../../../model/response/video_response.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_text.dart';
import '../movie_detail_provider.dart';

class DetailButtons extends StatelessWidget {
  final Movie movie;
  final MovieDetailProvider ref;
  const DetailButtons({
    super.key,
    required this.ref,
    required this.movie
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          color: context.getColorScheme().onPrimary,
          boxShadow: const [
            BoxShadow(
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomElevatedButton(
              width: double.infinity,
              height: 40,
              function: () async {
                Video? video = await showDialog(context: context, builder: (context){
                  return VideoListDialog(videos: ref.videos);
                });
                await Future.delayed(const Duration(milliseconds: 300));
                if(video != null){
                  showDialog(context: Routing.navigatorKey.currentContext ?? context, builder: (context){
                    return YoutubePlayerDialog(video: video);
                  });
                }
              },
              child: CustomText(
                textToDisplay: lang(context).watchTrailer ?? "Watch Trailer",
                textStyle: context
                    .getTextTheme()
                    .bodySmall
                    ?.copyWith(
                    color:
                    context.getColorScheme().onPrimary),
              ),
            ),
          ),
          eightPx,
          Expanded(
            child: CustomElevatedButton(
              width: double.infinity,
              height: 40,
              function: () {
                ref.routing.move(Routes.movieReview, argument: movie);
              },
              child: CustomText(
                textToDisplay: lang(context).seeReview ?? "See Review",
                textStyle: context
                    .getTextTheme()
                    .bodySmall
                    ?.copyWith(
                    color:
                    context.getColorScheme().onPrimary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}