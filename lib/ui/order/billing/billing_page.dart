import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_panda/extensions/media_query.dart';
import 'package:food_panda/extensions/theme.dart';
import 'package:food_panda/shared_ui/assets/graphic.dart';
import 'package:food_panda/shared_ui/assets/icons.dart';
import 'package:food_panda/shared_ui/assets/logo.dart';

class BillingScreen extends StatelessWidget {
  List<Widget> _addDivider(List<Widget> items) {
    List<Widget> result = [];
    for (int i = 0; i < items.length - 1; i++) {
      result.add(items[i]);
      result.add(Divider());
    }
    result.add(items.last);
    return result;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(title: Text("PAYMENT METHOD"), centerTitle: true),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: context.height - kToolbarHeight ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Thêm thẻ ngân hàng
              Container(
                height: 57,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                margin: EdgeInsets.symmetric(vertical: 25),
                color: context.colorScheme.surface,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Icon(
                      AppIcons.wallet,
                      color: context.colorScheme.primary,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                        child: Text("Add a new card",
                            style:
                                TextStyle(color: context.colorScheme.shadow))),
                    Icon(
                      CupertinoIcons.right_chevron,
                      color: context.colorScheme.shadow,
                    )
                  ],
                ),
              ),

              ///Tài khoản đã thêm
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "BANK ACCOUNTS",
                  style: context.textTheme.labelSmall
                      ?.copyWith(color: context.colorScheme.shadow),
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  color: context.colorScheme.surface,
                  child: Column(
                    children: _addDivider(List.generate(
                      1,
                      (index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Text("Frankin Campbell  - ***6383",
                                    style: TextStyle(
                                        color: context.colorScheme.onSurface))),
                            Icon(
                              CupertinoIcons.right_chevron,
                              color: context.colorScheme.shadow,
                            )
                          ],
                        ),
                      ),
                    )),
                  )),

              ///Thẻ tín dụng
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "CREDIT CARDS",
                  style: context.textTheme.labelSmall
                      ?.copyWith(color: context.colorScheme.shadow),
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  color: context.colorScheme.surface,
                  child: Column(
                    children: _addDivider(List.generate(
                      3,
                          (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Text("Frankin Campbell  - ***6383",
                                    style: TextStyle(
                                        color: context.colorScheme.onSurface))),
                            SvgPicture.asset(LogoAssets.visa)
                          ],
                        ),
                      ),
                    )),
                  )),
              ///Footer graphic
              Image.asset(
                GraphicAssets.billingBackground,
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
