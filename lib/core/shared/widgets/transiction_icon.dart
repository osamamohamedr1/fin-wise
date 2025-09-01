import 'package:finance_wise/core/functions/get_icon_and_color.dart';
import 'package:finance_wise/core/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TransictionIcon extends StatelessWidget {
  const TransictionIcon({super.key, required this.transaction});

  final TransactionModel transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 55.h,
      decoration: BoxDecoration(
        color: getBackgroundColor(transaction.title),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: SvgPicture.asset(
          transaction.iconPath ?? getDefaultIcon(transaction.category),
          width: 24,
          height: 24,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
    );
  }
}
