import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading:
              IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.search)),
          title: Text("NOTIFICATION"),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
          centerTitle: true,
        ),
        SliverPadding(
          padding: EdgeInsets.all(10),
          sliver: SliverList.separated(
            itemBuilder: (context, i) => NotificationBadge(),
            separatorBuilder: (context, i) => Divider(),
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
    return Row(
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
