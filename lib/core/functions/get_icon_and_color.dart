import 'dart:ui';

import 'package:finance_wise/core/utils/assets.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';

String getDefaultIcon(String category) {
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

Color getBackgroundColor(String category) {
  switch (category.toLowerCase()) {
    case 'salary':
    case 'savings':
    case 'rent':
      return ColorsManager.blue;
    default:
      return ColorsManager.lightBlue;
  }
}
