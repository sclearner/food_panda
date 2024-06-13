import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_panda/blocs/auth_bloc/auth_bloc.dart';
import 'package:food_panda/shared_ui/assets/logo.dart';

class UserAvatar extends StatelessWidget {
  final double? radius;
  const UserAvatar({super.key, this.radius});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state)
    {
      dynamic image;
      if (state.user.avatarUrl != null) {
        image = NetworkImage(state.user.avatarUrl!);
      }
      else {
        image = const AssetImage(LogoAssets.original);
      }
      return Container(
        width: radius != null ? radius! * 2 : null,
        height: radius != null ? radius! * 2 : null,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: image,
              fit: BoxFit.cover
            ),
            borderRadius: BorderRadius.circular(9999)),
        transform: Matrix4.translationValues(0, 0, 0),
      );
    }
  );
}}