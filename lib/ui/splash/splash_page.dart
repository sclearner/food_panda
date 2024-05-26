import 'package:flutter/material.dart';
import 'package:food_panda/extensions/media_query.dart';
import 'package:food_panda/extensions/theme.dart';
import 'package:food_panda/shared_ui/assets/graphic.dart';
import 'package:food_panda/shared_ui/assets/logo.dart';

///Màn hình splash cho ứng dụng, hiển thị cho đến khi load được toàn bộ thông tin
class SplashScreen extends StatelessWidget {
  final double _logoLeft = -21;
  final double _logoHeight = 424;

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          /// Phần logo
          Container(
            decoration: const BoxDecoration(),
            clipBehavior: Clip.hardEdge,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: context.height / 2,
                  width: context.width - 2 * _logoLeft,
                  transform: Matrix4.translationValues(_logoLeft, 0, 0),
                  decoration: BoxDecoration(
                      color: context.colorScheme.primary,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(150))),
                  child: Image.asset(LogoAssets.original),
                ),
              ],
            ),
          ),

          /// Phần mascot
          Expanded(
              child: Stack(
            children: [
              ///Background
              Container(
                padding: const EdgeInsets.only(bottom: 35),
                alignment: Alignment.bottomCenter,
                child: Image.asset(GraphicAssets.splashBackground,
                    fit: BoxFit.fitHeight,
                    height: 344,
                    width: context.width,
                    repeat: ImageRepeat.repeatX),
              ),

              ///Mascot
              Container(
                  padding: const EdgeInsets.only(bottom: 8, top: 20),
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    GraphicAssets.mascot,
                    scale: 0.15,
                  ))
            ],
          ))
        ],
      ),
    );
  }
}
