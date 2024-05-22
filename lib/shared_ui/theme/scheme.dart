import 'package:flutter/material.dart';
import 'package:food_panda/shared_ui/theme/colors.dart';

/// Bảng màu tuân theo m3 material
/// [Tài liệu](https://m3.material.io/styles/color/system/overview)
const appColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.rose,
    primaryContainer: AppColors.rose,
    onPrimary: AppColors.white,
    onPrimaryContainer: AppColors.white,
    secondary: AppColors.jam,
    onSecondary: AppColors.white,
    tertiary: AppColors.platinum,
    onTertiary: AppColors.darkGray,
    error: AppColors.viettelRed,
    onError: AppColors.white,
    background: AppColors.snow,
    onBackground: AppColors.black,
    surface: AppColors.white,
    onSurface: AppColors.black,
    onSurfaceVariant: AppColors.gray,
    shadow: AppColors.sliver,

);