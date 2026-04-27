import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/theme_controller.dart';
import '../../application/settings_controller.dart';
import '../../data/models/app_theme_mode.dart';
import '../widgets/about_focuszen_card.dart';
import '../widgets/settings_card.dart';
import '../widgets/settings_header.dart';
import '../widgets/settings_section_label.dart';
import '../widgets/settings_tile.dart';
import '../widgets/theme_selector.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsControllerProvider);
    final settingsController = ref.read(settingsControllerProvider.notifier);

    final themeMode = ref.watch(themeControllerProvider);
    final themeController = ref.read(themeControllerProvider.notifier);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 16, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SettingsHeader(),

            const SizedBox(height: 28),

            Text(
              'Settings',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Tailor your path to deep focus.',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.textMuted),
            ),

            const SizedBox(height: 30),

            const SettingsSectionLabel('TIMER PREFERENCES'),
            const SizedBox(height: 10),
            SettingsCard(
              children: [
                SettingsTile(
                  icon: Icons.timer_rounded,
                  title: 'Auto-start focus',
                  trailing: Switch(
                    value: settings.autoStartFocus,
                    onChanged: settingsController.setAutoStartFocus,
                  ),
                ),
                SettingsTile(
                  icon: Icons.hourglass_bottom_rounded,
                  title: 'Auto-start break',
                  trailing: Switch(
                    value: settings.autoStartBreak,
                    onChanged: settingsController.setAutoStartBreak,
                  ),
                ),
                const SettingsTile(
                  icon: Icons.tune_rounded,
                  title: 'Presets',
                  subtitle: 'Pomodoro',
                  trailing: Icon(
                    Icons.chevron_right_rounded,
                    color: AppColors.textMuted,
                  ),
                ),
                const SettingsTile(
                  icon: Icons.edit_rounded,
                  title: 'Custom duration',
                  subtitle: '45 min',
                  trailing: Icon(
                    Icons.chevron_right_rounded,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 26),

            const SettingsSectionLabel('FEEDBACK'),
            const SizedBox(height: 10),
            SettingsCard(
              children: [
                SettingsTile(
                  icon: Icons.volume_up_rounded,
                  title: 'Sound effects',
                  trailing: Switch(
                    value: settings.soundEffects,
                    onChanged: settingsController.setSoundEffects,
                  ),
                ),
                SettingsTile(
                  icon: Icons.vibration_rounded,
                  title: 'Haptic vibration',
                  trailing: Switch(
                    value: settings.hapticVibration,
                    onChanged: settingsController.setHapticVibration,
                  ),
                ),
                const SettingsTile(
                  icon: Icons.music_note_rounded,
                  title: 'Completion sound',
                  subtitle: 'Zen Gong',
                  trailing: Icon(
                    Icons.play_circle_fill_rounded,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 26),

            const SettingsSectionLabel('APPEARANCE'),
            const SizedBox(height: 10),
            ThemeSelector(
              selectedTheme: themeMode.label,
              onChanged: (value) {
                themeController.setTheme(value.toThemeMode());
              },
            ),

            const SizedBox(height: 28),

            const AboutFocusZenCard(),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
