import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading:
              IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.search)),
          title: const Text("NOTIFICATION"),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.settings))],
          centerTitle: true,
        ),
        SliverPadding(
          padding: const EdgeInsets.all(10),
          sliver: SliverList.separated(
            itemBuilder: (context, i) => const NotificationBadge(),
            separatorBuilder: (context, i) => const Divider(),
          ),
        )
      ],
    );
  }
}

class NotificationBadge extends StatelessWidget {
  const NotificationBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FlutterLogo(size: 80),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text("Title"), Text("Description"), Text("Time to read")],
        )
      ],
    );
  }
}
