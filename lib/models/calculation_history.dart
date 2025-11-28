class CalculationHistoryItem {
  final String expression;
  final String result;
  final DateTime time;

  CalculationHistoryItem({
    required this.expression,
    required this.result,
    required this.time,
  });

  Map<String, dynamic> toJson() => {
    'expression': expression,
    'result': result,
    'time': time.toIso8601String(),
  };

  factory CalculationHistoryItem.fromJson(Map<String, dynamic> json) {
    return CalculationHistoryItem(
      expression: json['expression'] as String,
      result: json['result'] as String,
      time: DateTime.parse(json['time'] as String),
    );
  }
}
