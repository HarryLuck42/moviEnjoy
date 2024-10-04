import 'package:flutter/material.dart';
import 'package:my_products/initial/locale/localizations.dart';
import 'package:my_products/layout/movie_detail/movie_detail_provider.dart';

import '../../../core/constraint/spacer.dart';
import '../../../widgets/custom_text.dart';

class SecondBodyDetail extends StatelessWidget {
  final MovieDetailProvider ref;
  const SecondBodyDetail({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
              textToDisplay: "${lang(context).synopsis ?? "Synopsis"}:",
              textAlign: TextAlign.start,
              textStyle: const TextStyle(fontWeight: FontWeight.w700)),
          CustomText(
            textToDisplay: ref.detail?.overview ?? (lang(context).noSynopsis ?? "It doesn't have a synopsis"),
            textAlign: TextAlign.start,
            maxLines: 100,),
          eightPx,
          Row(
            children: [
              CustomText(
                  textToDisplay: "${lang(context).homepage ?? "Homepage"}:",
                  textAlign: TextAlign.start,
                  textStyle: const TextStyle(fontWeight: FontWeight.w700)),
              fourPx,
              Expanded(child: CustomText(
                textToDisplay: ref.detail?.homepage ?? "-",
                textAlign: TextAlign.start,))
            ],
          )
        ],
      ),
    );
  }
}
