import 'package:flutter/material.dart';
import 'package:food_panda/extensions/theme.dart';
import 'package:food_panda/shared_ui/components/dish_bar/dish_bar.dart';
import 'package:food_panda/shared_ui/components/photo_gallery/photo_gallery.dart';
import 'package:food_panda/shared_ui/components/product_card/product_card.dart';
import 'package:food_panda/shared_ui/components/review_bar/review_bar.dart';
import 'package:food_panda/shared_ui/theme/colors.dart';

part 'product_details.dart';

part 'product_photo_gallery.dart';

part 'product_description.dart';

part 'product_menu.dart';

part 'product_review.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 290,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                  'https://cdn.tgdd.vn/Files/2021/09/14/1382544/lau-sukiyaki-la-gi-tim-hieu-cach-nau-lau-sukiyaki-nhat-ban-202201031105547812.jpg',
                  fit: BoxFit.cover),
            ),
          ),

          ///Details
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: ProductScreenDetails(),
          )),

          /// Photos Gallery
          SliverToBoxAdapter(child: ProductPhotoGallery()),

          /// Mô tả (không có sẵn)
          SliverToBoxAdapter(
            child: ProductDescription(),
          ),

          /// Menu
          SliverToBoxAdapter(
            child: ProductMenu(),
          ),

          ///Review
          SliverToBoxAdapter(
            child: ProductReview(),
          ),

          ///End of page
          SliverToBoxAdapter(
            child: SizedBox(height: 54,)
          )
        ],
      ),
      bottomSheet: FilledButton(
        onPressed: () {},
        style: FilledButton.styleFrom(fixedSize: Size.fromHeight(54)),
        child: Center(
          child: Text("BOOK A TABLE"),
        ),
      ),
    );
  }
}
