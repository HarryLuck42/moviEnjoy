import 'package:flutter/material.dart';
import 'package:my_products/core/extention/extention.dart';

import '../../../core/constraint/asset_path.dart';
import '../../../core/constraint/spacer.dart';
import '../../../widgets/custom_icon.dart';
import '../../../widgets/custom_text.dart';
import '../movie_detail_provider.dart';

class HeaderDetail extends StatelessWidget {
  final MovieDetailProvider ref;

  const HeaderDetail({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 8),
          child: Image.asset(
            "${AssetPath.image}movie.png",
            width: 50,
            height: 50,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  (ref.detail?.title?.length ?? 0) > 17
                      ? Expanded(
                    child: CustomText(
                      textToDisplay: ref.detail?.title ?? "-",
                      textStyle: context.getTextTheme().titleSmall,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                    ),
                  )
                      : CustomText(
                    textToDisplay: ref.detail?.title ?? "-",
                    textStyle: context.getTextTheme().titleSmall,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                  ),
                  tenPx,
                  Transform.translate(
                    offset: const Offset(0, -2),
                    child: const CustomIcon(
                      iconData: "${AssetPath.vector}star.svg",
                      width: 20,
                      height: 20,
                      defaultColor: false,
                    ),
                  ),
                  CustomText(
                    textToDisplay:
                    ref.detail?.voteAverage?.toStringAsFixed(1) ?? "-",
                    textStyle: context
                        .getTextTheme()
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  CustomText(
                    textToDisplay: "/10",
                    textStyle: context
                        .getTextTheme()
                        .bodySmall
                        ?.copyWith(color: context.getColorScheme().secondary),
                  ),
                  tenPx
                ],
              ),
              Row(
                children: [
                  CustomText(
                    textToDisplay: ref.detail?.releaseDate ?? "-",
                    textStyle: context
                        .getTextTheme()
                        .bodySmall
                        ?.copyWith(color: context.getColorScheme().secondary),
                  ),
                  fourPx,
                  Container(
                    width: 1,
                    height: 15,
                    color: context.getColorScheme().secondary,
                  ),
                  fourPx,
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: ref.detail?.genres
                            ?.map((e) => (e.desc != null)
                            ? CustomText(
                          textToDisplay:
                          "${e.desc}${ref.detail?.genres?.indexOf(e) == ((ref.detail?.genres?.length ?? 0) - 1) ? "" : ", "}",
                          textStyle: context
                              .getTextTheme()
                              .bodySmall
                              ?.copyWith(
                              color: context
                                  .getColorScheme()
                                  .secondary),
                          textOverflow: TextOverflow.ellipsis,
                        )
                            : const SizedBox.shrink())
                            .toList() ??
                            [],
                      ),
                    ),
                  ),
                  tenPx
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}