import 'package:flutter/material.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/initial/locale/localizations.dart';

import '../../../core/constraint/const.dart';
import '../../../core/constraint/spacer.dart';
import '../../../widgets/custom_image_network.dart';
import '../../../widgets/custom_text.dart';
import '../movie_detail_provider.dart';

class FirstBodyDetail extends StatelessWidget {
  final MovieDetailProvider ref;

  const FirstBodyDetail({super.key, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageNetwork(
            imageUrl: "$imageUrl${ref.detail?.posterPath}",
            width: 150,
            height: 220,
            fit: BoxFit.contain,
          ),
          eightPx,
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _detailItem(lang(context).votes ?? "Votes", ref.detail?.voteCount?.toString() ?? "-"),
                  _detailItem(lang(context).popularity ?? "Popularity",
                      ref.detail?.popularity?.toStringAsFixed(1) ?? "-"),
                  _detailItems(
                      lang(context).production ?? "Production",
                      ref.detail?.productionCompanies
                          ?.map((e) => e.name)
                          .toList() ??
                          []),
                  _detailItems(
                      lang(context).country ?? "Country",
                      ref.detail?.productionCountries
                          ?.map((e) => e.name)
                          .toList() ??
                          []),
                  _detailItem(lang(context).budget ?? "Budget",
                      "USD ${ref.detail?.budget.toString().getCurrency() ?? "0"}"),
                  _detailItem(lang(context).revenue ?? "Revenue",
                      "USD ${ref.detail?.revenue.toString().getCurrency() ?? "0"}")
                ],
              ))
        ],
      ),
    );
  }

  Widget _detailItem(String title, String value) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 2,
            child: CustomText(
                textToDisplay: title,
                textAlign: TextAlign.start,
                textStyle: const TextStyle(fontWeight: FontWeight.w700))),
        const CustomText(textToDisplay: ":"),
        fourPx,
        Expanded(
            flex: 3,
            child: CustomText(
              textToDisplay: value,
              textAlign: TextAlign.start,
              maxLines: 3,
            )),
      ],
    );
  }

  Widget _detailItems(String title, List<String?> values) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 2,
            child: CustomText(
              textToDisplay: title,
              textAlign: TextAlign.start,
              textStyle: const TextStyle(fontWeight: FontWeight.w700),
            )),
        const CustomText(textToDisplay: ":"),
        fourPx,
        Expanded(
            flex: 3,
            child: Builder(builder: (context) {
              String data = "";
              if (values.length > 2) {
                for (int i = 0; i < values.length; i++) {
                  if (i == values.length - 1) {
                    data += "& ${values[i]}";
                  } else if (i == values.length - 2) {
                    data += "${values[i]} ";
                  } else {
                    data += "${values[i]}, ";
                  }
                }
              } else {
                if (values.isEmpty) {
                  data = "-";
                } else if (values.length == 1) {
                  data = values[0] ?? "-";
                } else {
                  data = "${values[0]} & ${values[1]}";
                }
              }

              return CustomText(
                textToDisplay: data,
                textAlign: TextAlign.start,
                maxLines: 3,
              );
            })),
      ],
    );
  }
}