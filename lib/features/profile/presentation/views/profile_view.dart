import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/shared/widgets/white_container.dart';
import 'package:finance_wise/core/utils/spacing.dart';
import 'package:finance_wise/features/profile/presentation/views/widgets/about_dialog.dart'
    as custom;
import 'package:finance_wise/features/profile/presentation/views/widgets/profile_about_section.dart';
import 'package:finance_wise/features/profile/presentation/views/widgets/profile_section_title.dart';
import 'package:finance_wise/features/profile/presentation/views/widgets/profile_settings_section.dart';
import 'package:finance_wise/features/profile/presentation/views/widgets/profile_snack_bars.dart';
import 'package:finance_wise/features/profile/presentation/views/widgets/security_bottom_sheet.dart';
import 'package:finance_wise/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          LocaleKeys.profile.tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          verticalSpacing(32),
          Expanded(
            child: WhiteContainer(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpacing(24),
                    ProfileSectionTitle(title: LocaleKeys.settings.tr()),
                    ProfileSettingsSection(
                      onSecurityTap: () => _showSecurityOptions(context),
                    ),
                    verticalSpacing(24),
                    ProfileSectionTitle(title: LocaleKeys.about.tr()),
                    ProfileAboutSection(
                      onAboutTap: () => _showAboutDialog(context),
                      onShareTap: () => _shareApp(context),
                    ),
                    verticalSpacing(32),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSecurityOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => SecurityBottomSheet(
        onPinTap: () => ProfileSnackBars.showComingSoon(
          context,
          LocaleKeys.pin_setup_coming.tr(),
        ),
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const custom.AboutDialog(),
    );
  }

  void _shareApp(BuildContext context) {
    const String driveLink =
        'https://drive.google.com/drive/folders/1AAIgosrnrLauMf7-bv-eNwwgd_MYmfg1?usp=drive_link'; // Replace with your actual drive link
    const String shareMessage =
        'Check out this amazing Finance Wise app! Download it here: $driveLink';

    Share.share(shareMessage, subject: 'Finance Wise App');
  }
}
