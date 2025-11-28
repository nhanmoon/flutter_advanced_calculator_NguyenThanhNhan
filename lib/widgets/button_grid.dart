import 'package:flutter/material.dart';
import 'calculator_button.dart';

class ButtonGrid extends StatelessWidget {
  final void Function(String value) onInput;
  final VoidCallback onClear;
  final VoidCallback onClearEntry;
  final VoidCallback onEvaluate;

  const ButtonGrid({
    super.key,
    required this.onInput,
    required this.onClear,
    required this.onClearEntry,
    required this.onEvaluate,
  });

  @override
  Widget build(BuildContext context) {
    // Basic mode layout theo đề:
    // C  CE  %  ÷
    // 7  8  9  ×
    // 4  5  6  -
    // 1  2  3  +
    // ±  0  .  =

    final buttons = [
      'C',
      'CE',
      '%',
      '÷',
      '7',
      '8',
      '9',
      '×',
      '4',
      '5',
      '6',
      '-',
      '1',
      '2',
      '3',
      '+',
      '±',
      '0',
      '.',
      '=',
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: buttons.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        final label = buttons[index];

        return CalculatorButton(
          label: label,
          isAccent: label == '=' || label == '+' || label == '-' || label == '×' || label == '÷',
          onTap: () {
            switch (label) {
              case 'C':
                onClear();
                break;
              case 'CE':
                onClearEntry();
                break;
              case '=':
                onEvaluate();
                break;
              default:
                onInput(label);
            }
          },
        );
      },
    );
  }
}
