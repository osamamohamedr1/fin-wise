import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/features/home/presentation/views/widgets/home_status_cards.dart';
import 'package:flutter/material.dart';

class HomeInfoContainer extends StatelessWidget {
  const HomeInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.2,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: ColorsManager.mainGreen,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [HomeStatusCards()],
      ),
    );
  }
}
