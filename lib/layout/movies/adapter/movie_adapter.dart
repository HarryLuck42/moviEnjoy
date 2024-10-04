import 'package:flutter/material.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/layout/dialog/video_list_dialog.dart';
import 'package:my_products/layout/dialog/youtube_player_dialog.dart';
import 'package:my_products/widgets/custom_gesture.dart';

import '../../../core/constraint/asset_path.dart';
import '../../../core/constraint/const.dart';
import '../../../core/constraint/enum.dart';
import '../../../core/constraint/spacer.dart';
import '../../../core/routing/routes.dart';
import '../../../core/routing/routing.dart';
import '../../../model/response/movies_response.dart';
import '../../../model/response/video_response.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_image_network.dart';
import '../../../widgets/custom_text.dart';
import '../movies_provider.dart';

class MovieCard extends StatefulWidget {
  final Movie movie;
  final int position;
  final MoviesProvider ref;
  const MovieCard({super.key, required this.movie,
    required this.position,
    required this.ref});

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    final double itemHeight = context.getHeight();
    final double itemWidth = context.getWidth();
    return Container(
      width: (itemWidth / 2) - 8,
      height: itemHeight * 0.5,
      margin: const EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 4),
      child: CustomGesture(
        onTap: () {
          widget.ref.stopLoad();
          widget.ref.routing.move(Routes.movieDetail, argument: widget.movie);
        },
        radius: 12,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.15),
                  blurRadius: 2.6,
                  spreadRadius: 0,
                  offset: Offset(
                    1.95,
                    1.95,
                  ),
                ),
              ],
              color: context.getColorScheme().secondaryContainer),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12)),
                child: CustomImageNetwork(
                  imageUrl: "$imageUrl${widget.movie.posterPath}",
                  width: double.infinity,
                  height: itemHeight * 0.35,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: CustomText(
                    textToDisplay: widget.movie.title ?? "",
                    textStyle: context
                        .getTextTheme()
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  )),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(
                      width: 40,
                      height: 40,
                      iconData: "${AssetPath.vector}trailers.svg",
                      onPressed: () async {
                        widget.ref.getVideos(context, widget.movie, (videos) async {
                          Video? video = await showDialog(
                              context: context,
                              builder: (context) {
                                return VideoListDialog(videos: videos);
                              });
                          await Future.delayed(
                              const Duration(milliseconds: 300));
                          if (video != null) {
                            showDialog(
                                context: Routing.navigatorKey.currentContext ??
                                    context,
                                builder: (context) {
                                  return YoutubePlayerDialog(video: video);
                                });
                          }
                        });
                      }),
                  sixPx,
                  CustomIconButton(
                      width: 40,
                      height: 40,
                      iconData:
                      "${AssetPath.vector}${(widget.ref.isBookmarked(widget.movie) || widget.ref.currPage == MoviePage.bookmarks) ? "bookmark_yes" : "bookmark_no"}.svg",
                      onPressed: () async {
                        widget.ref.saveBookmark(widget.movie);
                        Future.delayed(const Duration(milliseconds: 500), (){
                          setState(() {
                          });
                        });
                      }),
                  sixPx,
                  CustomIconButton(
                    width: 40,
                    height: 40,
                    iconData: "${AssetPath.vector}detail.svg",
                    onPressed: () {
                      widget.ref.stopLoad();
                      widget.ref.routing.move(Routes.movieReview, argument: widget.movie);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


}

