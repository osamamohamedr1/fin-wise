import 'package:finance_wise/core/models/transaction_model.dart';
import 'package:finance_wise/core/utils/assets.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
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
        color: ColorsManager.lightBlue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: SvgPicture.asset(
          transaction.iconPath ?? _getDefaultIcon(transaction.category),
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
    );
  }
}

String _getDefaultIcon(String category) {
  switch (category.toLowerCase()) {
    case 'food':
    case 'dinner':
    case 'pantry':
      return Assets.svgsFood;
    case 'transport':
    case 'fuel':
      return Assets.svgsTransport;
    case 'groceries':
      return Assets.svgsGroceries;
    case 'salary':
      return Assets.svgsSalary;
    case 'rent':
      return Assets.svgsRent;
    case 'entertainment':
      return Assets.svgsEntertainment;
    case 'medical':
      return Assets.svgsMedical;
    case 'savings':
      return Assets.svgsSavings;
    case 'gift':
      return Assets.svgsGift;
    case 'travel':
      return Assets.svgsTravel;
    case 'car':
      return Assets.svgsCar;
    default:
      return Assets.svgsTransaction;
  }
}
