import 'package:flutter/material.dart';

enum M2Opacity { highEmphasis, pressed, mediumEmphasis, disabled }

abstract class ColorPalette {
  Color primary({M2Opacity opacity});

  Color primaryDark({M2Opacity opacity});

  Color primaryLight({M2Opacity opacity});

  Color accent({M2Opacity opacity});

  Color background({M2Opacity opacity});

  Color surface({M2Opacity opacity});

  Color error({M2Opacity opacity});

  Color contentPrimary({M2Opacity opacity});

  Color contentPrimaryInverse({M2Opacity opacity});

  Color contentAccent({M2Opacity opacity});

  Color contentError({M2Opacity opacity});

  Color contentAlert({M2Opacity opacity});

  Color contentPositive({M2Opacity opacity});

  Color getColorWithOpacity(
    Color color,
    M2Opacity opacity,
  ) {
    switch (opacity) {
      case M2Opacity.pressed:
        return color.withOpacity(0.8);
      case M2Opacity.mediumEmphasis:
        return color.withOpacity(0.6);
      case M2Opacity.disabled:
        return color.withOpacity(0.4);
      default:
        return color;
    }
  }
}
