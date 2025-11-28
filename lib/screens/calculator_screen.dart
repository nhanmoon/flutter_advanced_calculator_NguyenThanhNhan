import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/calculator_provider.dart';
import '../providers/theme_provider.dart';
import '../models/calculator_settings.dart';
import '../widgets/display_area.dart';
import '../widgets/button_grid.dart';
import 'history_screen.dart';
import 'settings_screen.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int _currentIndex = 0; // 0: calc, 1: history, 2: settings

  @override
  Widget build(BuildContext context) {
    final calc = context.watch<CalculatorProvider>();
    final theme = context.watch<ThemeProvider>();

    final pages = [
      _buildCalculatorPage(calc, theme),
      const HistoryScreen(),
      const SettingsScreen(),
    ];

    return Scaffold(
      body: SafeArea(
        child: pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) {
          setState(() {
            _currentIndex = i;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calc',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildCalculatorPage(
      CalculatorProvider calc, ThemeProvider theme) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          DisplayArea(
            expression: calc.expression,
            currentResult: calc.currentResult,
            previousResult: calc.previousResult,
            errorMessage: calc.errorMessage,
            isDeg: theme.settings.angleMode == AngleMode.degrees,
            hasMemory: calc.hasMemory,
          ),
          Expanded(
            child: ButtonGrid(
              onInput: calc.input,
              onClear: calc.clear,
              onClearEntry: calc.clearEntry,
              onEvaluate: calc.evaluate,
            ),
          ),
        ],
      ),
    );
  }
}
