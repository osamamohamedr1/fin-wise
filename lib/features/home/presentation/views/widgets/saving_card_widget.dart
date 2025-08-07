import 'package:finance_wise/core/utils/assets.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SavingCardWidget extends StatelessWidget {
  const SavingCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        Stack(
          children: [
            Center(
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.08,
                width: MediaQuery.sizeOf(context).height * 0.08,
                child: CircularProgressIndicator(
                  value: .5,
                  strokeWidth: 3,
                  color: ColorsManager.blue,
                  backgroundColor: ColorsManager.lightBackground,
                ),
              ),
            ),

            Positioned(
              top: 17,
              left: 19,
              child: SvgPicture.asset(Assets.svgsCar, width: 50),
            ),
          ],
        ),

        Text(
          'Savings\nOn Goals',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
