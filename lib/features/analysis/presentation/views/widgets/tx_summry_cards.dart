import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SummaryCard extends StatelessWidget {
  final String title;
  final String amount;
  final String icon;
  final Color color;

  const SummaryCard({
    super.key,
    required this.title,
    required this.amount,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: color, width: .2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            width: 20.w,
            height: 20.h,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          ),
          SizedBox(height: 12.h),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: ColorsManager.darkContainer,
              fontWeight: FontWeight.w500,
            ),
          ),
          verticalSpacing(4),
          Text(
            amount,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
        ],
      ),
    );
  }
}
