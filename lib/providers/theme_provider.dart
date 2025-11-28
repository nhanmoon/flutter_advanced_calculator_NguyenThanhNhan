import 'package:flutter/material.dart';
import '../models/calculator_settings.dart';

class ThemeProvider extends ChangeNotifier {
  CalculatorSettings _settings = const CalculatorSettings();

  CalculatorSettings get settings => _settings;

  ThemeMode get themeMode {
    switch (_settings.themeMode) {
      case ThemeModeSetting.light:
        return ThemeMode.light;
      case ThemeModeSetting.dark:
        return ThemeMode.dark;
      case ThemeModeSetting.system:
      default:
        return ThemeMode.system;
    }
  }

  void updateSettings(CalculatorSettings newSettings) {
    _settings = newSettings;
    notifyListeners();
  }

  void changeThemeMode(ThemeModeSetting mode) {
    _settings = _settings.copyWith(themeMode: mode);
    notifyListeners();
  }

  void changeAngleMode(AngleMode mode) {
    _settings = _settings.copyWith(angleMode: mode);
    notifyListeners();
  }

  void changeDecimalPrecision(int precision) {
    _settings = _settings.copyWith(decimalPrecision: precision);
    notifyListeners();
  }
}
