enum AngleMode { degrees, radians }
enum ThemeModeSetting { light, dark, system }

class CalculatorSettings {
  final ThemeModeSetting themeMode;
  final int decimalPrecision;
  final AngleMode angleMode;
  final bool hapticFeedback;
  final bool soundEffects;
  final int historySize;

  const CalculatorSettings({
    this.themeMode = ThemeModeSetting.system,
    this.decimalPrecision = 4,
    this.angleMode = AngleMode.degrees,
    this.hapticFeedback = true,
    this.soundEffects = false,
    this.historySize = 50,
  });

  CalculatorSettings copyWith({
    ThemeModeSetting? themeMode,
    int? decimalPrecision,
    AngleMode? angleMode,
    bool? hapticFeedback,
    bool? soundEffects,
    int? historySize,
  }) {
    return CalculatorSettings(
      themeMode: themeMode ?? this.themeMode,
      decimalPrecision: decimalPrecision ?? this.decimalPrecision,
      angleMode: angleMode ?? this.angleMode,
      hapticFeedback: hapticFeedback ?? this.hapticFeedback,
      soundEffects: soundEffects ?? this.soundEffects,
      historySize: historySize ?? this.historySize,
    );
  }
}
