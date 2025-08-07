import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/routing/app_router.dart';
import 'package:finance_wise/core/routing/routes.dart';
import 'package:finance_wise/core/themes/app_themes.dart';
import 'package:finance_wise/features/profile/presentation/manger/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinanceTracker extends StatelessWidget {
  const FinanceTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit()..loadTheme(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeState) {
          return ScreenUtilInit(
            designSize: const Size(430, 932),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                themeMode: themeState,
                theme: AppThemes.lightTheme,
                darkTheme: AppThemes.darkTheme,
                initialRoute: Routes.bottomNavBar,
                onGenerateRoute: onGenerateRoute,
              );
            },
          );
        },
      ),
    );
  }
}
