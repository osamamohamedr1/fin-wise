import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class WhiteContainer extends StatelessWidget {
  const WhiteContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: ColorsManager.lightBackground,
        borderRadius: BorderRadius.vertical(top: Radius.circular(60)),
      ),
      child: child,
    );
  }
}
