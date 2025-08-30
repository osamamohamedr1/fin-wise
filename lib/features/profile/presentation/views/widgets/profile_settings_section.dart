import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/features/profile/presentation/views/widgets/arrow_trailing_icon.dart';
import 'package:finance_wise/features/profile/presentation/views/widgets/language_selector.dart';
import 'package:finance_wise/features/profile/presentation/views/widgets/setting_option_widget.dart';
import 'package:finance_wise/features/profile/presentation/views/widgets/theme_toggle_switch.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ProfileSettingsSection extends StatelessWidget {
  final VoidCallback onSecurityTap;

  const ProfileSettingsSection({super.key, required this.onSecurityTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        verticalSpacing(0),
        _buildLanguageSetting(),
        _buildThemeSetting(),
        // _buildSecuritySetting(),
      ],
    );
  }

  Widget _buildLanguageSetting() {
    return SettingOptionWidget(
      icon: Icons.language,
      title: LocaleKeys.language.tr(),
      // subtitle: LocaleKeys.language_subtitle.tr(),
      iconColor: Colors.blue,
      trailing: const LanguageSelector(),
    );
  }

  Widget _buildThemeSetting() {
    return SettingOptionWidget(
      icon: Icons.dark_mode,
      title: LocaleKeys.dark_mode.tr(),
      // subtitle: LocaleKeys.theme_subtitle.tr(),
      iconColor: Colors.purple,
      trailing: const ThemeToggleSwitch(),
    );
  }

  // ignore: unused_element
  Widget _buildSecuritySetting() {
    return SettingOptionWidget(
      icon: Icons.security,
      title: LocaleKeys.security.tr(),
      subtitle: LocaleKeys.security_subtitle.tr(),
      iconColor: Colors.orange,
      trailing: const ArrowTrailingIcon(),
      onTap: onSecurityTap,
    );
  }
}
