
import 'package:flutter/material.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/initial/locale/localizations.dart';
import 'package:my_products/model/response/video_response.dart';
import 'package:my_products/widgets/custom_text.dart';

import '../../core/constraint/spacer.dart';

class VideoListDialog extends StatelessWidget {
  final List<Video> videos;
  const VideoListDialog({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    final heightDialog = context.getHeight() * 0.8;
    final widthDialog = context.getWidth() * 0.9;
    return AlertDialog(
      backgroundColor: context.getColorScheme().onSecondary,
      content: Builder(builder: (context) {
        return Container(
          height: heightDialog,
          width: widthDialog,
          decoration:
          BoxDecoration(color: context.getColorScheme().onSecondary),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                child: CustomText(textToDisplay: lang(context).movieTrailers ?? "Movie Trailers", textStyle: context.getTextTheme().titleSmall,),
              ),
              eightPx,
              Expanded(
                child: _listReviewLayout(context),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _listReviewLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(videos.length, (index) {
          return Column(
            children: [
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context, videos[index]);
                  },
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                            left: 10, top: 5, bottom: 5, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            tenPx,
                            Expanded(
                              child: CustomText(
                                textToDisplay: videos[index].name ?? '-',
                                textAlign: TextAlign.start,
                                textStyle: context
                                    .getTextTheme()
                                    .labelLarge
                                    ?.copyWith(fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: context.getTheme().colorScheme.secondary,
              )
            ],
          );
        }),
      ),
    );
  }
}
