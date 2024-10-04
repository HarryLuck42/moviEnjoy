import 'package:flutter/material.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../model/response/video_response.dart';

class YoutubePlayerDialog extends StatelessWidget {
  final Video video;
  const YoutubePlayerDialog({super.key, required this.video});


  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: video.key ??'iLnmTe5Q2Qw',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
      ),
    );

    return Dialog(
      backgroundColor: Colors.transparent,
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: YoutubePlayerBuilder(player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: context.getColorScheme().primary,
          progressColors: ProgressBarColors(
            playedColor: context.getColorScheme().primary,
            handleColor: context.getColorScheme().primary.withOpacity(0.6),
          ),
          onReady: () {
            _controller.addListener((){

            });
          },
        ), builder: (context, player){
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
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
                color: context.getColorScheme().onPrimary),
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
                child: player),
          );
        }),
      ),
    );
  }
}
