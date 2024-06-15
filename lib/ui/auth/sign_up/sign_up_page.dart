import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_panda/blocs/auth_bloc/auth_bloc.dart';
import 'package:food_panda/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:food_panda/exceptions/sign_up_exception.dart';
import 'package:food_panda/extensions/media_query.dart';
import 'package:food_panda/extensions/theme.dart';
import 'package:food_panda/repositories/auth_repo.dart';
import 'package:food_panda/routes/router.dart';
import 'package:food_panda/shared_ui/assets/graphic.dart';
import 'package:food_panda/shared_ui/assets/logo.dart';
import 'package:food_panda/shared_ui/theme/colors.dart';

import 'additional_function.dart';
part 'sign_up_form.dart';
part 'sign_up_field_builder.dart';

///Màn hình đăng nhập của ứng dụng
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(authRepo: RepositoryProvider.of(context)),
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
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Column(
                  children: [
                    Image.asset(LogoAssets.original),
                    SignUpForm(),
                    SafeArea(
                      child: Align(
                              alignment: Alignment.bottomCenter,
                              child: AdditionalFunction()),
                    ),
                    SizedBox(height: 200)
                  ],
                ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



