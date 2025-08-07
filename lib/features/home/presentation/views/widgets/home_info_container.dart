import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/features/home/presentation/views/widgets/home_status_cards.dart';
import 'package:flutter/material.dart';

class HomeInfoContainer extends StatelessWidget {
  const HomeInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.85,
      height: MediaQuery.sizeOf(context).height * 0.20,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: ColorsManager.mainGreen,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [HomeStatusCards()],
      ),
    );
  }
}
