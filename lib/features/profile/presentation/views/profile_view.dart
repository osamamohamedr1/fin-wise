import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/shared/widgets/white_container.dart';
import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/features/profile/presentation/views/widgets/language_selector.dart';
import 'package:finance_wise/features/profile/presentation/views/widgets/profile_header_widget.dart';
import 'package:finance_wise/features/profile/presentation/views/widgets/setting_option_widget.dart';
import 'package:finance_wise/features/profile/presentation/views/widgets/theme_toggle_switch.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            _buildProfileInfo(),
            verticalSpacing(32),
            Expanded(
              child: WhiteContainer(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSettingsSection(context),
                      verticalSpacing(24),
                      _buildAboutSection(context),
                      verticalSpacing(32),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: Row(
        children: [
          Text(
            LocaleKeys.profile.tr(),
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 28.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: const ProfileHeaderWidget(),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 18.sp,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1.h,
      color: Colors.grey[200],
      indent: 84.w,
      endIndent: 20.w,
    );
  }

  Widget _buildArrowTrailing() {
    return Icon(Icons.arrow_forward_ios, size: 16.r, color: Colors.grey[400]);
  }

  Widget _buildSettingsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, LocaleKeys.settings.tr()),
        verticalSpacing(16),
        _buildLanguageSetting(),
        _buildDivider(),
        _buildThemeSetting(),
        _buildDivider(),
        _buildSecuritySetting(context),
      ],
    );
  }

  Widget _buildLanguageSetting() {
    return SettingOptionWidget(
      icon: Icons.language,
      title: LocaleKeys.language.tr(),
      subtitle: LocaleKeys.language_subtitle.tr(),
      iconColor: Colors.blue,
      trailing: const LanguageSelector(),
    );
  }

  Widget _buildThemeSetting() {
    return SettingOptionWidget(
      icon: Icons.dark_mode,
      title: LocaleKeys.theme.tr(),
      subtitle: LocaleKeys.theme_subtitle.tr(),
      iconColor: Colors.purple,
      trailing: const ThemeToggleSwitch(),
    );
  }

  Widget _buildSecuritySetting(BuildContext context) {
    return SettingOptionWidget(
      icon: Icons.security,
      title: LocaleKeys.security.tr(),
      subtitle: LocaleKeys.security_subtitle.tr(),
      iconColor: Colors.orange,
      trailing: _buildArrowTrailing(),
      onTap: () => _showSecurityOptions(context),
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(context, LocaleKeys.about.tr()),
        verticalSpacing(16),
        _buildAboutSetting(context),
        _buildDivider(),
        _buildShareSetting(context),
      ],
    );
  }

  Widget _buildAboutSetting(BuildContext context) {
    return SettingOptionWidget(
      icon: Icons.info,
      title: LocaleKeys.about.tr(),
      subtitle: LocaleKeys.about_subtitle.tr(),
      iconColor: Colors.indigo,
      trailing: _buildArrowTrailing(),
      onTap: () => _showAboutDialog(context),
    );
  }

  Widget _buildShareSetting(BuildContext context) {
    return SettingOptionWidget(
      icon: Icons.share,
      title: LocaleKeys.share_app.tr(),
      iconColor: Colors.teal,
      trailing: _buildArrowTrailing(),
      onTap: () => _shareApp(context),
    );
  }

  void _showSecurityOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildSecurityBottomSheet(context),
    );
  }

  Widget _buildSecurityBottomSheet(BuildContext context) {
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
            () => _showComingSoonSnackBar(
              context,
              LocaleKeys.pin_setup_coming.tr(),
            ),
          ),
          _buildSecurityOption(
            context,
            Icons.fingerprint,
            LocaleKeys.fingerprint_auth.tr(),
            LocaleKeys.fingerprint_subtitle.tr(),
            () => _showComingSoonSnackBar(
              context,
              LocaleKeys.fingerprint_setup_coming.tr(),
            ),
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

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        title: Text(
          LocaleKeys.about.tr(),
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.app_name.tr(),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
              ),
            ),
            verticalSpacing(8),
            Text(
              LocaleKeys.app_version.tr(),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
                fontSize: 14.sp,
              ),
            ),
            verticalSpacing(16),
            Text(
              LocaleKeys.app_description.tr(),
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontSize: 14.sp),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(LocaleKeys.ok.tr()),
          ),
        ],
      ),
    );
  }

  void _shareApp(BuildContext context) {
    _showFeatureSnackBar(context, LocaleKeys.share_app.tr());
  }

  void _showComingSoonSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }

  void _showFeatureSnackBar(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature feature'),
        action: SnackBarAction(label: LocaleKeys.ok.tr(), onPressed: () {}),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }
}
