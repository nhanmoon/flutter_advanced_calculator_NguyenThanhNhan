import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/calculator_settings.dart';
import '../providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Theme'),
          Row(
            children: [
              _buildThemeRadio(
                context,
                'Light',
                ThemeModeSetting.light,
                theme,
              ),
              _buildThemeRadio(
                context,
                'Dark',
                ThemeModeSetting.dark,
                theme,
              ),
              _buildThemeRadio(
                context,
                'System',
                ThemeModeSetting.system,
                theme,
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Angle Mode'),
          Row(
            children: [
              _buildAngleRadio(
                  context, 'Degrees', AngleMode.degrees, theme),
              _buildAngleRadio(
                  context, 'Radians', AngleMode.radians, theme),
            ],
          ),
          const SizedBox(height: 16),
          const Text('Decimal precision'),
          Slider(
            value: theme.settings.decimalPrecision.toDouble(),
            min: 2,
            max: 10,
            divisions: 8,
            label: theme.settings.decimalPrecision.toString(),
            onChanged: (v) {
              theme.changeDecimalPrecision(v.toInt());
            },
          ),
        ],
      ),
    );
  }

  Widget _buildThemeRadio(
      BuildContext context,
      String label,
      ThemeModeSetting value,
      ThemeProvider theme) {
    return Expanded(
      child: RadioListTile<ThemeModeSetting>(
        dense: true,
        title: Text(label),
        value: value,
        groupValue: theme.settings.themeMode,
        onChanged: (v) {
          if (v != null) {
            theme.changeThemeMode(v);
          }
        },
      ),
    );
  }

  Widget _buildAngleRadio(
      BuildContext context, String label, AngleMode value, ThemeProvider theme) {
    return Expanded(
      child: RadioListTile<AngleMode>(
        dense: true,
        title: Text(label),
        value: value,
        groupValue: theme.settings.angleMode,
        onChanged: (v) {
          if (v != null) {
            theme.changeAngleMode(v);
          }
        },
      ),
    );
  }
}
