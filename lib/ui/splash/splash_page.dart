import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_panda/blocs/auth_bloc/auth_bloc.dart';
import 'package:food_panda/extensions/media_query.dart';
import 'package:food_panda/extensions/theme.dart';
import 'package:food_panda/repositories/auth_repo.dart';
import 'package:food_panda/shared_ui/assets/graphic.dart';
import 'package:food_panda/shared_ui/assets/logo.dart';
import 'package:go_router/go_router.dart';

///Màn hình splash cho ứng dụng, hiển thị cho đến khi load được toàn bộ thông tin
class SplashScreen extends StatefulWidget {
  final String? redirectLink;

  const SplashScreen({super.key, this.redirectLink});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final double _logoLeft = -21;

  final double _logoHeight = 424;

  double _alignmentX = 1000;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status != AuthStatus.unknown) {
            context.go(widget.redirectLink ?? '/home');
          }
        },
        child: Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              /// Phần logo
              Container(
                decoration: const BoxDecoration(),
                clipBehavior: Clip.hardEdge,
                child: FutureBuilder(
                    future: Future.delayed(5.seconds),
                    builder: (context, snapshot) {
                      List<Widget> longerThanUsual = (snapshot.hasData)
                          ? [
                              Center(
                                child: Text(
                                    "Connecting to server is longer than usual"),
                              )
                            ]
                          : [];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: context.height / 2,
                            width: context.width - 2 * _logoLeft,
                            transform:
                                Matrix4.translationValues(_logoLeft, 0, 0),
                            decoration: BoxDecoration(
                                color: context.colorScheme.primary,
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(150))),
                            child: Image.asset(LogoAssets.original),
                          ),
                          ...longerThanUsual
                        ],
                      );
                    }),
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
                  FutureBuilder(
                      future: Future.delayed(100.ms).then((_) {
                        setState(() {
                          _alignmentX = 0;
                        });
                      }),
                      builder: (context, snapshot) {
                        return AnimatedContainer(
                            alignment: Alignment.bottomCenter,
                            transform:
                                Matrix4.translationValues(_alignmentX, 0, 0),
                            duration: 2.seconds,
                            curve: Curves.easeOut,
                            child: Image.asset(
                              GraphicAssets.mascot,
                              scale: 0.15,
                            ));
                      })
                ],
              ))
            ],
          ),
        ));
  }
}
