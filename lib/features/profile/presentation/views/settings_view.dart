import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/features/profile/presentation/manger/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Switch(
            value: context.watch<ThemeCubit>().state == ThemeMode.dark,
            onChanged: (value) {
              context.read<ThemeCubit>().toggleTheme();
            },
          ),
          ElevatedButton(
            onPressed: () {
              context.setLocale(Locale('ar'));
            },
            child: Text('تغيير للعربية'),
          ),

          ElevatedButton(
            onPressed: () {
              context.setLocale(Locale('en'));
            },
            child: Text('Change to English'),
          ),
        ],
      ),
    );
  }
}
