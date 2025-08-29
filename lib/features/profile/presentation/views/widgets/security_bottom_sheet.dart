import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class SecurityBottomSheet extends StatelessWidget {
  final VoidCallback onPinTap;
  final VoidCallback onFingerprintTap;

  const SecurityBottomSheet({
    super.key,
    required this.onPinTap,
    required this.onFingerprintTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      padding: EdgeInsets.all(24.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.security.tr(),
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
            ),
          ),
          verticalSpacing(24),
          _buildSecurityOption(
            context,
            Icons.pin,
            LocaleKeys.set_up_pin.tr(),
            LocaleKeys.pin_subtitle.tr(),
            onPinTap,
          ),
          _buildSecurityOption(
            context,
            Icons.fingerprint,
            LocaleKeys.fingerprint_auth.tr(),
            LocaleKeys.fingerprint_subtitle.tr(),
            onFingerprintTap,
          ),
          verticalSpacing(24),
        ],
      ),
    );
  }

  Widget _buildSecurityOption(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).primaryColor),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
    );
  }
}
