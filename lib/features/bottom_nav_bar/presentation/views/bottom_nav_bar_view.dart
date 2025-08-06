import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:finance_wise/features/Transictions/presentation/views/transictions_view.dart';
import 'package:finance_wise/features/analysis/presentation/views/analysis_view.dart';
import 'package:finance_wise/features/categories/presentation/views/categories_view.dart';
import 'package:finance_wise/features/home/presentation/views/home_view.dart';
import 'package:finance_wise/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';

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
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          HomeView(),
          AnalysisView(),
          TransictionsView(),
          CategoriesView(),
          ProfileView(),
        ],
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.sizeOf(context).height / 8,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              offset: Offset(0, 4),
              color: Colors.black38,
            ),
          ],
          color: ColorsManager.lightGreen,
          borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: ActiveIcon(icon: Icons.home),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.analytics),
              activeIcon: ActiveIcon(icon: Icons.analytics),
              label: 'Analysis',
            ),

            const BottomNavigationBarItem(
              icon: Icon(Icons.transform),
              activeIcon: ActiveIcon(icon: Icons.compare_arrows_outlined),
              label: 'Transactions',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.category),
              activeIcon: ActiveIcon(icon: Icons.category),
              label: 'Categories',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              activeIcon: ActiveIcon(icon: Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class ActiveIcon extends StatelessWidget {
  const ActiveIcon({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        color: ColorsManager.mainGreen,
        borderRadius: BorderRadius.all(Radius.circular(18.0)),
      ),
      child: Icon(icon, size: 30),
    );
  }
}
