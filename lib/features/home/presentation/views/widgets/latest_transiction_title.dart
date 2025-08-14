import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class LatestTransictionTitle extends StatelessWidget {
  const LatestTransictionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          LocaleKeys.latest_transactions.tr(),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        // TextButton(
        //   onPressed: () {
        //     // Navigate to full transactions view
        //   },
        //   child: Text(
        //     LocaleKeys.see_all.tr(),
        //     style: Theme.of(
        //       context,
        //     ).textTheme.bodyMedium?.copyWith(color: ColorsManager.blue),
        //   ),
        // ),
      ],
    );
  }
}
