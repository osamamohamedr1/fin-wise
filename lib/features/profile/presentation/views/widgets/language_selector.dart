import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  static const List<Map<String, dynamic>> _languages = [
    {'code': 'en', 'name': 'English', 'flag': '🇺🇸'},
    {'code': 'ar', 'name': 'العربية', 'flag': '🇸🇦'},
  ];

  @override
  Widget build(BuildContext context) {
    final currentLocale = context.locale;

    return PopupMenuButton<Locale>(
      offset: Offset(0, 50.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: _buildLanguageButton(context, currentLocale),
      itemBuilder: (context) => _buildLanguageMenuItems(),
      onSelected: (Locale locale) => context.setLocale(locale),
    );
  }

  Widget _buildLanguageButton(BuildContext context, Locale currentLocale) {
    final currentLanguage = _languages.firstWhere(
      (lang) => lang['code'] == currentLocale.languageCode,
      orElse: () => _languages.first,
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: ColorsManager.lightGreen,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            currentLanguage['name'],
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          horizontalSpacing(4),
          Icon(Icons.keyboard_arrow_down, size: 18.r),
        ],
      ),
    );
  }

  List<PopupMenuEntry<Locale>> _buildLanguageMenuItems() {
    return _languages.map((language) {
      return PopupMenuItem<Locale>(
        value: Locale(language['code']),
        child: Row(
          children: [
            Text(language['flag'], style: TextStyle(fontSize: 18.sp)),
            horizontalSpacing(12),
            Text(
              language['name'],
              style: TextStyle(fontSize: 14.sp, fontFamily: 'Poppins'),
            ),
          ],
        ),
      );
    }).toList();
  }
}
