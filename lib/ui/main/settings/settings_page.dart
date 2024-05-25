import 'package:flutter/material.dart';
import 'package:food_panda/extensions/theme.dart';
import 'package:food_panda/shared_ui/assets/graphic.dart';
import 'package:food_panda/shared_ui/theme/colors.dart';

///Trang settings của ứng dụng
class SettingsPage extends StatelessWidget {
  final List<Widget> _settingsListTiles = [
    ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.water,
        radius: 47 / 2,
      ),
      title: Text("Order history"),
      trailing: Icon(Icons.arrow_forward_ios),
    ),
    ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.grass,
        radius: 47 / 2,
      ),
      title: Text("Payment method"),
      trailing: Icon(Icons.arrow_forward_ios),
    ),
    ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.orange,
        radius: 47 / 2,
      ),
      title: Text("Reward credits"),
      trailing: Icon(Icons.arrow_forward_ios),
    ),
    ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.sun,
        radius: 47 / 2,
      ),
      title: Text("Settings"),
      trailing: Icon(Icons.arrow_forward_ios),
    ),
    ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.diamond,
        radius: 47 / 2,
      ),
      title: Text("Invite Friends"),
      trailing: Icon(Icons.arrow_forward_ios),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          Container(
            height: 278,
            padding: const EdgeInsets.all(25),
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
                image: DecorationImage(
              fit: BoxFit.none,
              alignment: const Alignment(-0.95, -0.5),
              repeat: ImageRepeat.repeat,
              image: const AssetImage(GraphicAssets.settingsBackgroundEffect),
              colorFilter: ColorFilter.mode(
                  context.colorScheme.primary, BlendMode.modulate),
            )),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 33.5,
                  backgroundColor: AppColors.viettelRed,
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Viettel Digital Talent",
                      style: context.textTheme.headlineLarge?.copyWith(
                        color: context.colorScheme.onPrimary,
                      ),
                    ),
                    Text(
                      "vdt@viettel.com.vn",
                      style: context.textTheme.headlineSmall
                          ?.copyWith(color: context.colorScheme.onPrimary),
                    )
                  ],
                )
              ],
            ),
          ),
          ..._settingsListTiles
        ],
    );
  }
}
