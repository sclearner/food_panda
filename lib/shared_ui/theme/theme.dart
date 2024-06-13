import 'dart:ui';

import 'package:flutter/material.dart';
import 'scheme.dart';
import 'typography.dart';

/// Theme sáng của ứng dụng, sử dụng bảng màu đã quy định.
/// Theme được sử dụng nhằm đồng bộ cách hiển thị các thành phần UI
final appTheme = ThemeData(
    colorScheme: appColorScheme,
    useMaterial3: true,
    fontFamily: 'Nunito',
    textTheme: textTheme,

    ///Định dạng của nút màu
    filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
            disabledBackgroundColor: HSLColor.fromColor(appColorScheme.primary)
                .withLightness(0.8)
                .toColor(),
            minimumSize: const Size.fromHeight(51),
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ))),

    ///Định dạng của hộp tìm kiếm chung
    searchBarTheme: SearchBarThemeData(
        backgroundColor: MaterialStatePropertyAll(appColorScheme.surface),
        surfaceTintColor: MaterialStatePropertyAll(appColorScheme.surface),
        shape: MaterialStatePropertyAll(
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(16))),
        constraints: BoxConstraints(minHeight: 51),
        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 10)),
        textStyle: MaterialStatePropertyAll(
            textTheme.bodyMedium?.copyWith(color: appColorScheme.onSurface)),
        hintStyle: MaterialStatePropertyAll(
            textTheme.labelLarge?.copyWith(color: appColorScheme.shadow))),
    tabBarTheme: TabBarTheme(
      tabAlignment: TabAlignment.start,
      indicatorColor: Colors.transparent,
      dividerColor: Colors.transparent,
      labelColor: appColorScheme.onPrimary,
      labelStyle: TextStyle(fontWeight: FontWeight.w700),
      unselectedLabelColor: appColorScheme.onPrimary,
    ),
    iconTheme: IconThemeData(color: appColorScheme.onPrimary),
    cardTheme: CardTheme(
      elevation: 2,
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: appColorScheme.primary,
        foregroundColor: appColorScheme.onPrimary),
    listTileTheme: ListTileThemeData(
      contentPadding: const EdgeInsets.all(20),
      titleTextStyle: textTheme.titleMedium,
      textColor: appColorScheme.onSurface,
    ),
    checkboxTheme: CheckboxThemeData(shape: CircleBorder()),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 4,
        backgroundColor: appColorScheme.surface,
        selectedItemColor: appColorScheme.primary,
        unselectedItemColor: appColorScheme.shadow));
