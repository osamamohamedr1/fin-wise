import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/features/profile/presentation/views/widgets/arrow_trailing_icon.dart';
import 'package:finance_wise/features/profile/presentation/views/widgets/profile_divider.dart';
import 'package:finance_wise/features/profile/presentation/views/widgets/setting_option_widget.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ProfileAboutSection extends StatelessWidget {
  final VoidCallback onAboutTap;
  final VoidCallback onShareTap;

  const ProfileAboutSection({
    super.key,
    required this.onAboutTap,
    required this.onShareTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpacing(16),
        _buildAboutSetting(),
        const ProfileDivider(),
        _buildShareSetting(),
      ],
    );
  }

  Widget _buildAboutSetting() {
    return SettingOptionWidget(
      icon: Icons.info,
      title: LocaleKeys.about.tr(),
      subtitle: LocaleKeys.about_subtitle.tr(),
      iconColor: Colors.indigo,
      trailing: const ArrowTrailingIcon(),
      onTap: onAboutTap,
    );
  }

  Widget _buildShareSetting() {
    return SettingOptionWidget(
      icon: Icons.share,
      title: LocaleKeys.share_app.tr(),
      iconColor: Colors.teal,
      trailing: const ArrowTrailingIcon(),
      onTap: onShareTap,
    );
  }
}
