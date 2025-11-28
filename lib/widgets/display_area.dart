import 'package:flutter/material.dart';

class DisplayArea extends StatelessWidget {
  final String expression;
  final String currentResult;
  final String previousResult;
  final String errorMessage;
  final bool isDeg;
  final bool hasMemory;

  const DisplayArea({
    super.key,
    required this.expression,
    required this.currentResult,
    required this.previousResult,
    required this.errorMessage,
    required this.isDeg,
    required this.hasMemory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Theme.of(context).colorScheme.surfaceVariant,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(isDeg ? 'DEG' : 'RAD'),
              if (hasMemory) const Text('M'),
            ],
          ),
          const SizedBox(height: 8),
          if (previousResult.isNotEmpty)
            Opacity(
              opacity: 0.6,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  previousResult,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          const SizedBox(height: 4),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: Text(
              expression.isEmpty ? '0' : expression,
              style: const TextStyle(fontSize: 32),
            ),
          ),
          const SizedBox(height: 4),
          if (errorMessage.isNotEmpty)
            Text(
              errorMessage,
              style: const TextStyle(color: Colors.red),
            )
          else
            Text(
              currentResult,
              style: const TextStyle(fontSize: 24),
            ),
        ],
      ),
    );
  }
}
