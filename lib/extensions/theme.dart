import 'package:flutter/material.dart';

/// Phần mở rộng cho [BuildContext] context nhằm viết gọn cho
/// [Theme.of]
extension ThemeExtension on BuildContext {
  /// Lấy [colorScheme] trong [Theme] của [context]
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  /// Lấy [textTheme] trong [Theme] của [context]
  TextTheme get textTheme => Theme.of(this).textTheme;
}