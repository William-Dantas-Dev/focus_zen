import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/theme_controller.dart';
import '../../../../l10n/app_localizations.dart';
import '../../application/settings_controller.dart';
import '../widgets/about_focuszen_card.dart';
import '../widgets/language_selector.dart';
import '../widgets/settings_card.dart';
import '../widgets/settings_header.dart';
import '../widgets/settings_section_label.dart';
import '../widgets/settings_tile.dart';
import '../widgets/theme_selector.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;

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
              l10n.settings,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              l10n.settingsSubtitle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),

            const SizedBox(height: 30),

            SettingsSectionLabel(l10n.timerPreferences),
            const SizedBox(height: 10),
            SettingsCard(
              children: [
                SettingsTile(
                  icon: Icons.timer_rounded,
                  title: l10n.autoStartFocus,
                  trailing: Switch(
                    value: settings.autoStartFocus,
                    onChanged: settingsController.setAutoStartFocus,
                  ),
                ),
                SettingsTile(
                  icon: Icons.hourglass_bottom_rounded,
                  title: l10n.autoStartBreak,
                  trailing: Switch(
                    value: settings.autoStartBreak,
                    onChanged: settingsController.setAutoStartBreak,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 26),

            SettingsSectionLabel(l10n.feedback),
            const SizedBox(height: 10),
            SettingsCard(
              children: [
                SettingsTile(
                  icon: Icons.volume_up_rounded,
                  title: l10n.soundEffects,
                  trailing: Switch(
                    value: settings.soundEffects,
                    onChanged: settingsController.setSoundEffects,
                  ),
                ),
                SettingsTile(
                  icon: Icons.vibration_rounded,
                  title: l10n.hapticVibration,
                  trailing: Switch(
                    value: settings.hapticVibration,
                    onChanged: settingsController.setHapticVibration,
                  ),
                ),
                SettingsTile(
                  icon: Icons.music_note_rounded,
                  title: l10n.completionSound,
                  subtitle: 'Zen Gong',
                  trailing: Icon(
                    Icons.play_circle_fill_rounded,
                    color: colorScheme.onSurface.withValues(alpha: 0.65),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 26),

            SettingsSectionLabel(l10n.language),
            const SizedBox(height: 10),
            const SettingsCard(children: [LanguageSelector()]),

            const SizedBox(height: 26),

            SettingsSectionLabel(l10n.appearance),
            const SizedBox(height: 10),
            ThemeSelector(
              selectedTheme: themeMode,
              onChanged: (value) {
                themeController.setTheme(value);
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
