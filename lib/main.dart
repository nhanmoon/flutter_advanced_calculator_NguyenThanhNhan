import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/calculator_provider.dart';
import 'providers/history_provider.dart';
import 'providers/theme_provider.dart';
import 'screens/calculator_screen.dart';
import 'utils/constants.dart';

void main() {
  runApp(const AdvancedCalculatorApp());
}

class AdvancedCalculatorApp extends StatelessWidget {
  const AdvancedCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => HistoryProvider()),
        ChangeNotifierProxyProvider2<HistoryProvider, ThemeProvider,
            CalculatorProvider>(
          create: (context) => CalculatorProvider(
            historyProvider: context.read<HistoryProvider>(),
            themeProvider: context.read<ThemeProvider>(),
          ),
          update: (context, history, theme, previous) {
            return CalculatorProvider(
              historyProvider: history,
              themeProvider: theme,
            );
          },
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Advanced Calculator',
            themeMode: themeProvider.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              primaryColor: AppColors.lightPrimary,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: AppColors.darkPrimary,
            ),
            home: const CalculatorScreen(),
          );
        },
      ),
    );
  }
}
