import 'package:easy_localization/easy_localization.dart';
import 'package:finance_wise/core/routing/app_router.dart';
import 'package:finance_wise/features/analysis/presentation/manager/cubit/analysis_cubit.dart';
import 'package:finance_wise/core/routing/routes.dart';
import 'package:finance_wise/core/services/transaction_service.dart';
import 'package:finance_wise/features/categories/presentation/manager/transactions_cubit/categories_cubit.dart';
import 'package:finance_wise/features/home/presentation/manger/cubit/home_cubit.dart';
import 'package:finance_wise/features/transictions/presentation/manager/transactions_cubit/transaction_cubit.dart';
import 'package:finance_wise/core/themes/app_themes.dart';
import 'package:finance_wise/features/profile/presentation/manger/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinanceTracker extends StatelessWidget {
  const FinanceTracker({super.key});
  //
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()..loadTheme()),
        BlocProvider(
          create: (context) =>
              TransactionsCubit(TransactionsService())..getAllTransactions(),
        ),

        BlocProvider(
          create: (context) => AnalysisCubit()..loadDailyChart(DateTime.now()),
        ),

        BlocProvider(
          create: (context) => CategoriesCubit(TransactionsService()),
        ),

        BlocProvider(
          create: (context) =>
              HomeCubit(TransactionsService())..getNumbersDetails(),
        ),
      ],
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
