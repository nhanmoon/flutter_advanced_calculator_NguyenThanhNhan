import 'package:flutter/material.dart';
import '../models/calculator_mode.dart';
import '../models/calculation_history.dart';
import '../models/calculator_settings.dart';
import '../utils/calculator_logic.dart';
import 'history_provider.dart';
import 'theme_provider.dart';

class CalculatorProvider extends ChangeNotifier {
  final HistoryProvider historyProvider;
  final ThemeProvider themeProvider;

  String _expression = '';
  String _currentResult = '0';
  String _previousResult = '';
  String _errorMessage = '';
  CalculatorMode _mode = CalculatorMode.basic;
  double _memoryValue = 0;

  CalculatorProvider({
    required this.historyProvider,
    required this.themeProvider,
  });

  String get expression => _expression;
  String get currentResult => _currentResult;
  String get previousResult => _previousResult;
  String get errorMessage => _errorMessage;
  CalculatorMode get mode => _mode;
  bool get hasMemory => _memoryValue != 0;

  void changeMode(CalculatorMode newMode) {
    _mode = newMode;
    notifyListeners();
  }

  void input(String value) {
    _errorMessage = '';
    _expression += value;
    notifyListeners();
  }

  void clear() {
    _expression = '';
    _currentResult = '0';
    _errorMessage = '';
    notifyListeners();
  }

  void clearEntry() {
    if (_expression.isNotEmpty) {
      _expression = _expression.substring(0, _expression.length - 1);
    }
    notifyListeners();
  }

  void evaluate() {
    final logic = CalculatorLogic(themeProvider.settings);
    final result = logic.evaluateExpression(_expression);

    if (result == 'Error') {
      _errorMessage = 'Invalid expression';
    } else {
      _previousResult = _currentResult;
      _currentResult = result;
      historyProvider.addHistory(
        CalculationHistoryItem(
          expression: _expression,
          result: result,
          time: DateTime.now(),
        ),
        themeProvider.settings.historySize,
      );
      _expression = result; // cho phép chain tính tiếp
    }
    notifyListeners();
  }

  // Memory functions: M+, M-, MR, MC
  void memoryAdd() {
    final value = double.tryParse(_currentResult);
    if (value != null) {
      _memoryValue += value;
      notifyListeners();
    }
  }

  void memorySubtract() {
    final value = double.tryParse(_currentResult);
    if (value != null) {
      _memoryValue -= value;
      notifyListeners();
    }
  }

  void memoryRecall() {
    _expression = _memoryValue.toString();
    _currentResult = _expression;
    notifyListeners();
  }

  void memoryClear() {
    _memoryValue = 0;
    notifyListeners();
  }
}
