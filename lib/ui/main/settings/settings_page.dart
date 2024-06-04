import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_panda/blocs/auth_bloc/auth_bloc.dart';
import 'package:food_panda/extensions/theme.dart';
import 'package:food_panda/repositories/auth_repo.dart';
import 'package:food_panda/routes/router.dart';
import 'package:food_panda/shared_ui/assets/graphic.dart';
import 'package:food_panda/shared_ui/assets/icons.dart';
import 'package:food_panda/shared_ui/components/user_avatar/user_avatar.dart';
import 'package:food_panda/shared_ui/theme/colors.dart';
import 'package:food_panda/ui/main/main_page.dart';
import 'package:go_router/go_router.dart';

///Trang settings của ứng dụng
class SettingsScreen extends StatelessWidget {
  List<Widget> _settingsListTiles(BuildContext context) =>
      [
        ListTile(
          onTap: () {
            MainRoute.mainScreenKey.currentState
                ?.switchTab(MainScreenChildren.history);
          },
          leading: const CircleAvatar(
            backgroundColor: AppColors.water,
            radius: 47 / 2,
            child: Icon(AppIcons.docs),
          ),
          title: const Text("Order history"),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          onTap: () => const BillingSettingsRoute().push(context),
          leading: const CircleAvatar(
            backgroundColor: AppColors.grass,
            radius: 47 / 2,
            child: Icon(AppIcons.wallet),
          ),
          title: const Text("Payment method"),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: AppColors.orange,
            radius: 47 / 2,
            child: Icon(AppIcons.star),
          ),
          title: Text("Reward credits"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: AppColors.sun,
            radius: 47 / 2,
            child: Icon(AppIcons.settings),
          ),
          title: Text("Settings"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: AppColors.diamond,
            radius: 47 / 2,
            child: Icon(AppIcons.account),
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
              const UserAvatar(radius: 33.5),
              const SizedBox(width: 10),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.user.name ?? "New User",
                        style: context.textTheme.headlineLarge?.copyWith(
                          color: context.colorScheme.onPrimary,
                        ),
                      ),
                      Text(
                        state.user.email ?? "No email",
                        style: context.textTheme.headlineSmall
                            ?.copyWith(color: context.colorScheme.onPrimary),
                      )
                    ],
                  );
                }
              )
            ],
          ),
        ),
        ..._settingsListTiles(context),
        Center(
          child: SignOutButton(),
        )
      ],
    );
  }
}

class SignOutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        _handlePressed(context);
      },
      style: TextButton.styleFrom(foregroundColor: context.colorScheme.error),
      child: const Text("Log out"),
    );
  }

  void _handlePressed(BuildContext context) async {
    await showDialog(context: context, builder: (context) =>
        BlocListener<AuthBloc, AuthState>(
          listener: (BuildContext context, state) {
            if (state.status == AuthStatus.unauth) LoginRoute().go(context);
          },
          child: AlertDialog(
            title: const Text("Log out"),
            content: const Text("Do you want to log out?"),
            actions: [
              TextButton(onPressed: () {
                context.read<AuthRepo>().logOut();
              }, child: const Text("OK")),
              TextButton(onPressed: () {
                context.pop();
              }, child: const Text("Cancel"))
            ],
          ),
        ));
  }
}