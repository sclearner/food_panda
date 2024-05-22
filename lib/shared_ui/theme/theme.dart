import 'package:flutter/material.dart';
import 'package:food_panda/shared_ui/theme/scheme.dart';

/// Theme sáng của ứng dụng, sử dụng bảng màu đã quy định.
/// Theme được sử dụng nhằm đồng bộ cách hiển thị các thành phần UI
final appTheme = ThemeData(
  colorScheme: appColorScheme,
  useMaterial3: true,
  fontFamily: 'Nunito',
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(51),
        shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      )
    )
  )
);