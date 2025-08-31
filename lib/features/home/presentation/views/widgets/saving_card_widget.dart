import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/utils/assets.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SavingCardWidget extends StatelessWidget {
  const SavingCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10,
      children: [
        Stack(
          children: [
            Center(
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.075,
                width: MediaQuery.sizeOf(context).height * 0.075,
                child: CircularProgressIndicator(
                  value: 0,
                  strokeWidth: 3,
                  color: ColorsManager.blue,
                  backgroundColor: ColorsManager.lightBackground,
                ),
              ),
            ),

            Positioned(
              top: 15,
              left: 30,
              child: SvgPicture.asset(Assets.svgsSavings, width: 35),
            ),
          ],
        ),

        Text(
          LocaleKeys.on_goals.tr(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
