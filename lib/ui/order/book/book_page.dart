import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_panda/extensions/media_query.dart';
import 'package:food_panda/extensions/theme.dart';
import 'package:food_panda/ui/order/success/order_success_page.dart';
import 'package:intl/intl.dart';

part 'date_picker.dart';

part 'book_menu.dart';

class BookScreen extends StatelessWidget {
  late final DateTime _today;

  BookScreen({super.key})
      : _today = (() {
          return DateTime.now();
        })();

  DateTime get _startDate => _today.subtract(Duration(days: _today.weekday));

  @override
  Widget build(BuildContext context) {
    final labelTextTheme = context.textTheme.labelMedium?.copyWith(
        color: context.colorScheme.onSurfaceVariant, fontWeight: FontWeight.w400);
    return Scaffold(
      extendBody: true,
      body: CustomScrollView(
        slivers: [
          ///AppBar
          SliverAppBar(
            title: Text("BOOK A TABLE"),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            foregroundColor: context.colorScheme.onSurface,
          ),

          ///Khu chọn ngày
          SliverToBoxAdapter(
              child: SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const PageScrollPhysics(),
              itemBuilder: (context, i) => SizedBox(
                width: context.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(7, (j) {
                    final date = _startDate.add(Duration(days: i * 7 + j));
                    print(date.difference(DateTime.now()).inDays);
                    return Expanded(
                      child: DatePicker(
                          date: date,
                          isActive: date.weekday > 0 && date.weekday < 6,
                          isChosen: date.isAtSameMomentAs(_today)),
                    );
                  }),
                ),
              ),
            ),
          )),

          ///Dải phân cách
          SliverToBoxAdapter(
            child: Divider(),
          ),

          ///Khu chọn giờ
          SliverToBoxAdapter(
            child: SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: List.generate(
                    8,
                    (i) => SizedBox(
                          width: context.width / 4.5,
                          child: TimePicker(isActive: i == 3, time: "${3 * i}:00"),
                        )),
              ),
            ),
          ),

          ///Khu số lượng
          SliverToBoxAdapter(
            child: Container(
              height: 120,
              padding: EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration:
                  BoxDecoration(color: context.colorScheme.surface, boxShadow: [
                BoxShadow(
                    color: context.colorScheme.shadow.withOpacity(0.3),
                    offset: Offset(0, 4),
                    blurRadius: 12)
              ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ORDERING",
                    style: labelTextTheme,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Number of person", style: labelTextTheme),
                      Row(
                        children: [
                          Text(
                            "2 Adults, 3 Children",
                            style: context.textTheme.labelMedium,
                          ),
                          Icon(CupertinoIcons.forward)
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),

          ///Khu menu
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(top: 20),
              decoration:
                  BoxDecoration(color: context.colorScheme.surface, boxShadow: [
                BoxShadow(
                    color: context.colorScheme.shadow.withOpacity(0.2),
                    offset: const Offset(0, 4),
                    blurRadius: 12)
              ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "MENU",
                      style: labelTextTheme,
                    ),
                  ),
                  BookMenu()
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: context.colorScheme.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total: \$123",
              style: context.textTheme.titleLarge
                  ?.copyWith(color: context.colorScheme.onPrimary),
            ),
            Row(
              children: [
                Text("ORDER",
                    style: context.textTheme.titleLarge
                        ?.copyWith(color: context.colorScheme.onPrimary)),
                SizedBox(width: 5),
                Icon(Icons.arrow_forward)
              ],
            )
          ],
        ),
      ),
    );
  }
}
