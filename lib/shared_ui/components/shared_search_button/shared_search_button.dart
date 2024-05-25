import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Nút tìm kiếm điều hướng tới trang tìm kiếm
class SharedSearchButton extends StatelessWidget {
  const SharedSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.search));
  }
}
