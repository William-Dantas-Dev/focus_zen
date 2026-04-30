import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
import '../../data/models/timer_preset_option.dart';
import 'preset_tile.dart';

class TimerPresetBottomSheet extends StatelessWidget {
  const TimerPresetBottomSheet({
    super.key,
    required this.selectedPreset,
    required this.onPresetSelected,
  });

  final TimerPresetOption selectedPreset;
  final ValueChanged<TimerPresetOption> onPresetSelected;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.black.withValues(alpha: 0.08),
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.35)
                : Colors.black.withValues(alpha: 0.12),
            blurRadius: 30,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 44,
                height: 5,
                decoration: BoxDecoration(
                  color: colorScheme.onSurface.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  Text(
                    l10n.chooseTimer,
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close_rounded),
                    color: colorScheme.onSurface.withValues(alpha: 0.65),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              /// 🔥 Aqui está o uso correto
              ...timerPresetOptions.map((preset) {
                final isSelected = preset.id == selectedPreset.id;

                return PresetTile(
                  preset: preset,
                  isSelected: isSelected,
                  onTap: () => onPresetSelected(preset),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
