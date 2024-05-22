import 'package:flutter/material.dart';

/// Phần mở rộng cho [BuildContext] context nhằm viết gọn cho
/// [MediaQuery.of]. Trong phần mở rộng này gồm các hàm:
///
/// * [context.mediaQuery] : Lấy toàn bộ [MediaQueryData] hiện tại của
/// context
/// * [context.size] : Lấy kích cỡ [Size] vùng mà [context] hiện tại ảnh hưởng
/// * [context.height] : Lấy chiều cao vùng mà [context] hiện tại ảnh hưởng
/// * [context.width] : Lấy chiều dài vùng mà [context] hiện tại ảnh hưởng
extension MediaQueryExtension on BuildContext {
  /// Lấy toàn bộ [MediaQueryData] hiện tại của context
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ///Lấy kích cỡ [Size] vùng mà [context] hiện tại ảnh hưởng
  Size get size => MediaQuery.of(this).size;
  ///Lấy chiều cao vùng mà [context] hiện tại ảnh hưởng (=100vh)
  double get width => MediaQuery.of(this).size.width;
  ///Lấy chiều dài vùng mà [context] hiện tại ảnh hưởng (=100vw)
  double get height => MediaQuery.of(this).size.height;

}