import 'package:flutter/material.dart';
import 'package:monopoly_admin/theme/web_palette.dart';

class Styles {
  static final elevatedButtonStyle = ElevatedButton.styleFrom(
      primary: WebPalette.primary,
      textStyle: const TextStyle(color: Colors.white),
      onPrimary: Colors.white);
  static final outlineButtonStyle = OutlinedButton.styleFrom(
    primary: WebPalette.primary,
    textStyle: const TextStyle(color: Colors.white),
    side: BorderSide(color: WebPalette.primary),
  );
}
