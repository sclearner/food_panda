import 'package:flutter/material.dart';
import 'package:food_panda/extensions/media_query.dart';
import 'package:food_panda/extensions/theme.dart';
import 'package:food_panda/shared_ui/assets/graphic.dart';
import 'package:food_panda/shared_ui/assets/icons.dart';
import 'package:food_panda/shared_ui/assets/logo.dart';
import 'package:food_panda/shared_ui/theme/colors.dart';

///Màn hình đăng nhập của ứng dụng
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
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
                  const Expanded(child: LoginForm()),
                  const Expanded(
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: AdditionalFunction()))
                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}

///Biểu mẫu đăng nhập trong trang Đăng nhập [LoginPage]
class LoginForm extends StatelessWidget {
  ///Biểu mẫu đăng nhập trong trang Đăng nhập [LoginPage]
  const LoginForm({super.key});

  InputDecoration _decoration(ColorScheme colorScheme) => InputDecoration(
      labelStyle: const TextStyle(color: AppColors.white),
      border: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.white)),
      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.white)),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colorScheme.primary, width: 3)));

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextFormField(
                    style: const TextStyle(color: AppColors.white),
                    decoration: _decoration(context.colorScheme)
                        .copyWith(labelText: "Username")),
                TextFormField(
                    style: const TextStyle(color: AppColors.white),
                    decoration: _decoration(context.colorScheme)
                        .copyWith(labelText: "Password")),
              ],
            ),
            FilledButton(onPressed: () {}, child: Text("LOGIN"))
          ],
        ),
      ),
    );
  }
}

///Các chức năng khác như đăng nhập bằng Facebook
///và đăng ký trong trang Đăng nhập [LoginPage]
class AdditionalFunction extends StatelessWidget {
  ///Các chức năng khác như đăng nhập bằng Facebook
  ///và đăng ký trong trang Đăng nhập [LoginPage]
  const AdditionalFunction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      FilledButton(
          onPressed: () {},
          style: FilledButton.styleFrom(backgroundColor: AppColors.blue),
          child: const OverflowBar(
            alignment: MainAxisAlignment.center,
            overflowAlignment: OverflowBarAlignment.center,
            children: [
              Icon(AppIcons.facebook),
              SizedBox(width: 10),
              Text("CONNECT WITH FACEBOOK")
            ],
          )),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: OverflowBar(
          alignment: MainAxisAlignment.center,
          overflowAlignment: OverflowBarAlignment.center,
          children: [
            const Text(
              "Don't have an account? ",
              style: TextStyle(color: AppColors.white),
            ),
            TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  splashFactory: NoSplash.splashFactory,
                ),
                child: Text("Sign up"))
          ],
        ),
      )
    ]);
  }
}
