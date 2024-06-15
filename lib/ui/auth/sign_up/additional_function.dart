import 'package:flutter/material.dart';
import 'package:food_panda/routes/router.dart';
import 'package:food_panda/shared_ui/assets/icons.dart';
import 'package:food_panda/shared_ui/theme/colors.dart';

///Các chức năng khác như đăng nhập bằng Facebook
///và đăng ký trong trang Đăng nhập [LoginScreen]
class AdditionalFunction extends StatelessWidget with AdditionalFunctions {
  ///Các chức năng khác như đăng nhập bằng Facebook
  ///và đăng ký trong trang Đăng nhập [LoginScreen]
  AdditionalFunction({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      FilledButton(
          onPressed: signInWithFacebook,
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
              "Have an account?",
              style: TextStyle(color: AppColors.white),
            ),
            TextButton(
                onPressed: () {
                  LoginRoute().go(context);
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  splashFactory: NoSplash.splashFactory,
                ),
                child: Text("Login"))
          ],
        ),
      )
    ]);
  }
}

mixin AdditionalFunctions {
  void signInWithFacebook() {}
}