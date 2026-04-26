import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import 'preset_tile.dart';
import 'timer_preset_option.dart';

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
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.35),
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
                  color: Colors.white.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),

              const SizedBox(height: 22),

              Row(
                children: [
                  Text(
                    'Choose timer',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close_rounded),
                    color: AppColors.textSecondary,
                  ),
                ],
              ),

              const SizedBox(height: 12),

              ...timerPresetOptions.map((preset) {
                final isSelected = preset == selectedPreset;

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
