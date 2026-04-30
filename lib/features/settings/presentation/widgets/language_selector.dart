import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/locale/locale_controller.dart';
import '../../../../l10n/app_localizations.dart';

class LanguageSelector extends ConsumerWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = ref.watch(localeControllerProvider);
    final controller = ref.read(localeControllerProvider.notifier);

    return Column(
      children: [
        _buildOption(
          context,
          title: l10n.systemDefault,
          isSelected: locale == null,
          onTap: () => controller.setLocale(null),
        ),
        _buildOption(
          context,
          title: l10n.portuguese,
          isSelected: locale?.languageCode == 'pt',
          onTap: () => controller.setLocale(const Locale('pt')),
        ),
        _buildOption(
          context,
          title: l10n.english,
          isSelected: locale?.languageCode == 'en',
          onTap: () => controller.setLocale(const Locale('en')),
        ),
      ],
    );
  }

  Widget _buildOption(
    BuildContext context, {
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      onTap: onTap,
      title: Text(title),
      trailing: isSelected
          ? Icon(Icons.check, color: colorScheme.primary)
          : null,
    );
  }
}