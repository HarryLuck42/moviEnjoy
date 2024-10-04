import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_products/core/constraint/asset_path.dart';
import 'package:my_products/core/constraint/spacer.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/model/response/review_movie_response.dart';
import 'package:my_products/widgets/custom_icon.dart';
import 'package:my_products/widgets/custom_text.dart';

class MovieReviewAdapter extends StatelessWidget {
  final Review review;

  const MovieReviewAdapter({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CustomIcon(
                  iconData: "${AssetPath.vector}person.svg",
                  width: 30,
                  height: 30,
                ),
                eightPx,
                Transform.translate(
                  offset: const Offset(0, 2),
                  child: CustomText(
                    textToDisplay: review.author ?? "-",
                    textStyle: context
                        .getTextTheme()
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
            fourPx,
            Container(
              width: double.infinity,
              height: 1,
              color: context.getColorScheme().secondary,
            ),
            eightPx,
            CustomText(
              textToDisplay: review.content ?? "-",
              textStyle: context.getTextTheme().bodyMedium,
              textAlign: TextAlign.start,
              maxLines: 100,
            )
          ],
        ),
      ),
    );
  }
}
