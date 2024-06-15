// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:food_panda/shared_ui/components/photo_gallery/photo_gallery.dart';
import 'package:food_panda/shared_ui/components/review_bar/review_star_bar.dart';

class ReviewBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CircleAvatar(
            radius: 42 / 2,
          ),
        ),
        Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 42,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("ABC"), Text("2 hours ago")],
                    ),
                    ReviewStarBar(
                      count: 4,
                    )
                  ],
                ),
              ),
              Text(
                "We had a wonderful dinner last nite. The food and staff were terrific. Often when we go to restaurants it is hard to find a menu that works well for the both of us. Random makes that a non-issue. My companion was not as hungry as I was. She asked for two appetizers, while I wanted an appetizer and a main. She only wanted an appetizer portion ",
                softWrap: true,
              ),
              //PhotoGallery()
            ],
          ),
        )
      ],
    );
  }
}
