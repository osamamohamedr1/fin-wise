import 'package:finance_wise/core/utils/assets.dart';
import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/features/transictions/presentation/views/transictions_view.dart';
import 'package:finance_wise/features/analysis/presentation/views/analysis_view.dart';
import 'package:finance_wise/features/categories/presentation/views/categories_view.dart';
import 'package:finance_wise/features/home/presentation/views/home_view.dart';
import 'package:finance_wise/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.lightBackground,
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          HomeView(),
          AnalysisView(),
          TransactionsView(),
          CategoriesView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.sizeOf(context).height / 8,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              offset: Offset(0, 4),
              color: Colors.black38,
            ),
          ],
          color: ColorsManager.lightGreen,
          borderRadius: BorderRadius.vertical(top: Radius.circular(60.0)),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.svgsHome, width: 25),
              activeIcon: const ActiveIcon(icon: Assets.svgsHome, width: 25),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.svgsAnalysis, width: 30),
              activeIcon: const ActiveIcon(icon: Assets.svgsAnalysis),
              label: 'Analysis',
            ),

            BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.svgsTransaction, width: 32),
              activeIcon: const ActiveIcon(
                icon: Assets.svgsTransaction,
                width: 33,
              ),
              label: 'Transactions',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.svgsCategorY, width: 28),
              activeIcon: const ActiveIcon(
                icon: Assets.svgsCategorY,
                width: 28,
              ),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(Assets.svgsPROFILE, width: 21),
              activeIcon: const ActiveIcon(icon: Assets.svgsPROFILE, width: 22),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class ActiveIcon extends StatelessWidget {
  const ActiveIcon({super.key, required this.icon, this.width});
  final String icon;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: const BoxDecoration(
        color: ColorsManager.mainGreen,
        borderRadius: BorderRadius.all(Radius.circular(18.0)),
      ),
      child: SvgPicture.asset(icon, width: width ?? 30),
    );
  }
}
