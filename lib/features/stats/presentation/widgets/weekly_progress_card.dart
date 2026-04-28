import 'package:flutter/material.dart';

class WeeklyProgressCard extends StatelessWidget {
  const WeeklyProgressCard({
    super.key,
    required this.weeklyFocusMinutes,
  });

  final List<int> weeklyFocusMinutes;

  static const days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final maxMinutes = weeklyFocusMinutes.isEmpty
        ? 1
        : weeklyFocusMinutes.reduce((a, b) => a > b ? a : b);

    final averageMinutes = weeklyFocusMinutes.isEmpty
        ? 0
        : weeklyFocusMinutes.reduce((a, b) => a + b) ~/ weeklyFocusMinutes.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Weekly Progress',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const Spacer(),
            Text(
              'This Week',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.45),
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Container(
          height: 150,
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 14),
          decoration: BoxDecoration(
            color: isDark
                ? Colors.white.withValues(alpha: 0.045)
                : Colors.black.withValues(alpha: 0.035),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: colorScheme.onSurface.withValues(alpha: 0.07),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: List.generate(7, (index) {
                    final minutes = index < weeklyFocusMinutes.length
                        ? weeklyFocusMinutes[index]
                        : 0;

                    final value = maxMinutes == 0 ? 0.0 : minutes / maxMinutes;
                    final isActive = index == DateTime.now().weekday - 1;

                    return Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            height: 70 * value.clamp(0.08, 1.0),
                            width: 8,
                            decoration: BoxDecoration(
                              color: isActive
                                  ? colorScheme.primary
                                  : colorScheme.onSurface.withValues(alpha: 0.14),
                              borderRadius: BorderRadius.circular(999),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            days[index],
                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: isActive
                                      ? colorScheme.primary
                                      : colorScheme.onSurface.withValues(alpha: 0.45),
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'Mon - Sun',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurface.withValues(alpha: 0.45),
                        ),
                  ),
                  const Spacer(),
                  Text(
                    'Avg. ${_formatMinutes(averageMinutes)}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatMinutes(int minutes) {
    final hours = minutes ~/ 60;
    final remainingMinutes = minutes % 60;

    if (hours == 0) return '${remainingMinutes}m';

    return '${hours}h ${remainingMinutes}m';
  }
}