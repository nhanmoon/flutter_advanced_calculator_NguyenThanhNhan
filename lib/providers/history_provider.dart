import 'package:flutter/material.dart';
import '../models/calculation_history.dart';

class HistoryProvider extends ChangeNotifier {
  final List<CalculationHistoryItem> _items = [];

  List<CalculationHistoryItem> get items =>
      List.unmodifiable(_items.reversed); // mới nhất lên trước

  void addHistory(CalculationHistoryItem item, int maxSize) {
    _items.add(item);
    if (_items.length > maxSize) {
      _items.removeAt(0); // bỏ cái cũ nhất
    }
    notifyListeners();
  }

  void clearHistory() {
    _items.clear();
    notifyListeners();
  }
}
