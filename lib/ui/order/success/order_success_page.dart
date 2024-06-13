import 'package:flutter/material.dart';
import 'package:food_panda/extensions/media_query.dart';
import 'package:food_panda/extensions/theme.dart';
import 'package:food_panda/shared_ui/assets/graphic.dart';

class OrderSuccessScreen extends Page {
  const OrderSuccessScreen({super.key});

  @override
  Route createRoute(BuildContext context) {
    return DialogRoute(
      context: context,
      barrierColor: context.colorScheme.onSurface.withOpacity(0.75),
      settings: this,
      builder: (_) => const OrderSuccessBody(),
    );
  }

}

class OrderSuccessBody extends StatelessWidget {
  const OrderSuccessBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width * 0.75,
      height: context.height * 0.8,
      child: Column(
        children: [
          Image.asset(GraphicAssets.mascot),
          const Text("Thank you!"),
          const Text("Your order is successfully"),
          FilledButton(onPressed: () {}, child: const Text("OK"))
        ],
      ),
    );
  }
}
