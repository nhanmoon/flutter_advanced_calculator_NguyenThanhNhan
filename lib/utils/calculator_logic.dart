import 'dart:math' as math;
import 'package:math_expressions/math_expressions.dart';
import '../models/calculator_settings.dart';

class CalculatorLogic {
  final CalculatorSettings settings;

  CalculatorLogic(this.settings);

  String evaluateExpression(String expression) {
    try {
      final expString = _preprocessExpression(expression);

      Parser parser = Parser();
      Expression exp = parser.parse(expString);

      ContextModel cm = ContextModel();

      double result = exp.evaluate(EvaluationType.REAL, cm);

      // Làm tròn theo số chữ số thập phân trong settings
      final factor =
      math.pow(10, settings.decimalPrecision).toDouble();
      final rounded = (result * factor).round() / factor;

      return rounded.toString();
    } catch (e) {
      return 'Error';
    }
  }

  String _preprocessExpression(String expression) {
    String exp = expression;

    // thay ký tự hiển thị sang ký tự mà math_expressions hiểu
    exp = exp.replaceAll('×', '*').replaceAll('÷', '/');
    exp = exp.replaceAll('π', 'pi');

    // 2π -> 2*pi
    exp = exp.replaceAllMapped(
      RegExp(r'(\d)pi'),
          (match) => '${match.group(1)}*pi',
    );

    return exp;
  }
}
