import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/stats_controller.dart';
import '../widgets/efficiency_ratio_card.dart';
import '../widgets/recent_activity_list.dart';
import '../widgets/stats_header.dart';
import '../widgets/streak_card.dart';
import '../widgets/today_focus_card.dart';
import '../widgets/weekly_progress_card.dart';

class StatsPage extends ConsumerWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(statsControllerProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StatsHeader(),
          const SizedBox(height: 24),

          TodayFocusCard(
            focusTime: stats.todayFocusFormatted,
            sessionsCompleted: stats.todaySessions,
          ),

          const SizedBox(height: 24),

          WeeklyProgressCard(weeklyFocusMinutes: stats.weeklyFocusMinutes),

          const SizedBox(height: 24),

          StreakCard(
            currentStreak: stats.currentStreak,
            bestStreak: stats.bestStreak,
          ),

          const SizedBox(height: 24),

          const EfficiencyRatioCard(),

          const SizedBox(height: 24),

          RecentActivityList(sessions: stats.recentSessions),
        ],
      ),
    );
  }
}
