import 'package:finance_wise/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Welcome Back',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text('Good Morning', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CircleAvatar(
              backgroundColor: ColorsManager.lightBackground,
              radius: 20,
              child: Center(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_outlined,
                    size: 24,
                    color: ColorsManager.darkIcon,
                  ),
                ),
              ),
            ),
          ),
        ],

        automaticallyImplyLeading: false,
      ),
      body: const CustomScrollView(),
    );
  }
}
