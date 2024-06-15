import 'package:flutter/material.dart';
import 'package:food_panda/extensions/media_query.dart';
import 'package:food_panda/extensions/theme.dart';
import 'package:food_panda/routes/router.dart';
import 'package:food_panda/shared_ui/assets/graphic.dart';
import 'package:food_panda/shared_ui/theme/colors.dart';

class OrderSuccessScreen extends Page<Widget> {
  OrderSuccessScreen({super.key});

  @override
  Route<Widget> createRoute(BuildContext context) {
    return DialogRoute(
      context: context,
      barrierColor: AppColors.overlay.withOpacity(0.5),
      settings: this,
      builder: (_) => OrderSuccessBody(),
    );
  }
}

class OrderSuccessBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 45),
        width: context.width * 0.75,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(GraphicAssets.mascot),
            const SizedBox(height: 30),
            Text(
              "Thank you!",
              style: context.textTheme.displayMedium,
            ),
            const Text(
              "Your order is successfully",
              style: TextStyle(fontFamily: 'Roboto'),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 126,
              height: 43,
              child: FilledButton(
                  onPressed: () {
                    HomeRoute().go(context);
                  },
                  child: Text("OK")),
            )
          ],
        ),
      ),
    );
  }
}
