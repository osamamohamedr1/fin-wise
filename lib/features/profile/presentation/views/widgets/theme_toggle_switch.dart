import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/features/profile/presentation/manger/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeToggleSwitch extends StatelessWidget {
  const ThemeToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeState) {
        final isDarkMode = themeState == ThemeMode.dark;

        return Switch(
          value: isDarkMode,
          onChanged: (value) {
            context.read<ThemeCubit>().toggleTheme();
          },
          activeColor: ColorsManager.mainGreen,
          activeTrackColor: ColorsManager.lightGreen,
          inactiveTrackColor: ColorsManager.lightGreen,

          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        );
      },
    );
  }
}
