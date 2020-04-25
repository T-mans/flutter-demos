import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'color_palette.dart';

/// BMW Colors are based on the BMW Styleguide
/// https://pages.code.connected.bmw/design/docs/bmw/themes
class BMWCombustionColors extends ColorPalette with EquatableMixin {
  @override
  List<Object> get props => [];

  /// Primary Swatches
  @override
  Color primary({M2Opacity opacity}) {
    const color = Color(0xFF1A1C1D);
    return getColorWithOpacity(color, opacity);
  }

  @override
  Color primaryDark({M2Opacity opacity}) {
    const color = Color(0xFF111111);
    return getColorWithOpacity(color, opacity);
  }

  @override
  Color primaryLight({M2Opacity opacity}) {
    const color = Color(0xFF404648);
    return getColorWithOpacity(color, opacity);
  }

  @override
  Color accent({M2Opacity opacity}) {
    const color = Color(0xFFFF5500);
    return getColorWithOpacity(color, opacity);
  }

  @override
  Color background({M2Opacity opacity}) {
    const color = Color(0xFF1A1C1D);
    return getColorWithOpacity(color, opacity);
  }

  @override
  Color surface({M2Opacity opacity}) {
    const color = Color(0xFF282A2C);
    return getColorWithOpacity(color, opacity);
  }

  @override
  Color error({M2Opacity opacity}) {
    const color = Color(0xFFFF2626);
    return getColorWithOpacity(color, opacity);
  }

  /// Content Swatches
  @override
  Color contentPrimary({M2Opacity opacity}) {
    const color = Color(0xFFFFFFFF);
    return getColorWithOpacity(color, opacity);
  }

  @override
  Color contentPrimaryInverse({M2Opacity opacity}) {
    const color = Color(0xFF111111);
    return getColorWithOpacity(color, opacity);
  }

  @override
  Color contentAccent({M2Opacity opacity}) {
    const color = Color(0xFFFF5500);
    return getColorWithOpacity(color, opacity);
  }

  @override
  Color contentError({M2Opacity opacity}) {
    const color = Color(0xFFFF2626);
    return getColorWithOpacity(color, opacity);
  }

  @override
  Color contentAlert({M2Opacity opacity}) {
    const color = Color(0xFFFFC846);
    return getColorWithOpacity(color, opacity);
  }

  @override
  Color contentPositive({M2Opacity opacity}) {
    const color = Color(0xFF50D600);
    return getColorWithOpacity(color, opacity);
  }
}
