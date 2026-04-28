import 'package:flutter/material.dart';
import '../../../home/presentation/pages/home_page.dart';
import '../../../settings/presentation/pages/settings_page.dart';
import '../../../stats/presentation/pages/stats_page.dart';
import '../widgets/bottom_nav.dart';

class MainShellPage extends StatefulWidget {
  const MainShellPage({super.key});

  @override
  State<MainShellPage> createState() => _MainShellPageState();
}

class _MainShellPageState extends State<MainShellPage> {
  int currentIndex = 0;

  void _selectTab(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topCenter,
            radius: 1.2,
            colors: [
              colorScheme.surface,
              Theme.of(context).scaffoldBackgroundColor,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: IndexedStack(
                  index: currentIndex,
                  children: const [
                    HomePage(),
                    StatsPage(),
                    SettingsPage(),
                  ],
                ),
              ),

              BottomNav(
                currentIndex: currentIndex,
                onItemSelected: _selectTab,
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}