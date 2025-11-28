import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CalculatorButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool isAccent;

  const CalculatorButton({
    super.key,
    required this.label,
    required this.onTap,
    this.isAccent = false,
  });

  @override
  State<CalculatorButton> createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.95;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0;
    });
    widget.onTap();
  }

  void _onTapCancel() {
    setState(() {
      _scale = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.isAccent ? Theme.of(context).colorScheme.secondary : null;

    return AnimatedScale(
      scale: _scale,
      duration: AppDimens.buttonAnimDuration,
      child: GestureDetector(
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        child: Container(
          decoration: BoxDecoration(
            color: color ?? Theme.of(context).colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(AppDimens.buttonRadius),
          ),
          alignment: Alignment.center,
          child: Text(
            widget.label,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
