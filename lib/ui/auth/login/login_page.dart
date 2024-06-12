import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_panda/blocs/auth_bloc/auth_bloc.dart';
import 'package:food_panda/blocs/login_bloc/login_bloc.dart';
import 'package:food_panda/exceptions/login_exception.dart';
import 'package:food_panda/extensions/media_query.dart';
import 'package:food_panda/extensions/theme.dart';
import 'package:food_panda/repositories/auth_repo.dart';
import 'package:food_panda/routes/router.dart';
import 'package:food_panda/shared_ui/assets/graphic.dart';
import 'package:food_panda/shared_ui/assets/icons.dart';
import 'package:food_panda/shared_ui/assets/logo.dart';
import 'package:food_panda/shared_ui/theme/colors.dart';

part 'additional_function.dart';
part 'login_form.dart';
///Màn hình đăng nhập của ứng dụng
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(authRepo: RepositoryProvider.of(context)),
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            ///Background
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(GraphicAssets.loginBackground),
                      fit: BoxFit.cover,
                      alignment: Alignment.center)),
            ),

            ///Scrolled UI
            Container(
              width: double.infinity,
              height: double.infinity,
              color: AppColors.black.withOpacity(0.5),
              child: SingleChildScrollView(
                  child: Container(
                height: context.height,
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Image.asset(LogoAssets.original)),
                    Expanded(child: LoginForm()),
                    Expanded(
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: AdditionalFunction()))
                  ],
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}



