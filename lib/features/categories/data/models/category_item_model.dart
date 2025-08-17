import 'package:finance_wise/core/utils/assets.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class CategoryItemModel {
  final String icon;
  final String label;
  final Color color;

  const CategoryItemModel({
    required this.icon,
    required this.label,
    required this.color,
  });
}

const List<CategoryItemModel> categoriesList = [
  CategoryItemModel(
    icon: Assets.svgsFood,
    label: LocaleKeys.food,
    color: ColorsManager.blue,
  ),
  CategoryItemModel(
    icon: Assets.svgsTransport,
    label: LocaleKeys.transport,
    color: ColorsManager.lightBlue,
  ),
  CategoryItemModel(
    icon: Assets.svgsMedical,
    label: LocaleKeys.medical,
    color: ColorsManager.mainGreen,
  ),
  CategoryItemModel(
    icon: Assets.svgsGroceries,
    label: LocaleKeys.groceries,
    color: ColorsManager.mainGreen,
  ),
  CategoryItemModel(
    icon: Assets.svgsRent,
    label: LocaleKeys.rent,
    color: ColorsManager.lightBlue,
  ),
  CategoryItemModel(
    icon: Assets.svgsGift,
    label: LocaleKeys.gifts,
    color: ColorsManager.blue,
  ),
  CategoryItemModel(
    icon: Assets.svgsSavings,
    label: LocaleKeys.savings,
    color: ColorsManager.blue,
  ),
  CategoryItemModel(
    icon: Assets.svgsEntertainment,
    label: LocaleKeys.entertainment,
    color: ColorsManager.lightBlue,
  ),
  CategoryItemModel(
    icon: Assets.svgsMore,
    label: LocaleKeys.fother,
    color: ColorsManager.mainGreen,
  ),
];
