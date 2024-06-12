import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:food_panda/blocs/product_bloc/product_bloc.dart';
import 'package:food_panda/extensions/theme.dart';
import 'package:food_panda/models/menu.dart';
import 'package:food_panda/repositories/product_repo.dart';
import 'package:food_panda/routes/router.dart';
import 'package:food_panda/shared_ui/components/dish_bar/dish_bar.dart';
import 'package:food_panda/shared_ui/components/photo_gallery/photo_gallery.dart';
import 'package:food_panda/shared_ui/components/product_card/product_card.dart';
import 'package:food_panda/shared_ui/components/review_bar/review_bar.dart';
import 'package:food_panda/shared_ui/theme/colors.dart';
import 'package:food_panda/ui/product/product/product_cover_gallery.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

part 'product_details.dart';

part 'product_photo_gallery.dart';

part 'product_description.dart';

part 'product_menu.dart';

part 'product_review.dart';

class ProductScreen extends StatelessWidget {
  final String productId;
  final Menu? menu;
  final ProductRepo _productRepo = ProductRepo();

  ProductScreen({super.key, required this.productId, this.menu});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _productRepo,
      child: BlocProvider(
        create: (_) => ProductBloc(
            productId: productId, productRepo: _productRepo, initialData: menu),
        child: Scaffold(
          body: Builder(builder: (context) {
            context.read<ProductBloc>().add(const ProductGetData());
            return BlocBuilder<ProductBloc, ProductState>(
                bloc: context.read<ProductBloc>(),
                builder: (context, state) {
                  if (state.menu == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        expandedHeight: 290,
                        flexibleSpace: FlexibleSpaceBar(
                          background: BlocBuilder<ProductBloc, ProductState>(
                              builder: (context, state) {
                            if (state.status == ProductStatus.loading &&
                                state.menu?.gallery?.elementAtOrNull(0) ==
                                    null) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: context.colorScheme.onPrimary,
                                ),
                              );
                            }
                            return ProductCoverGallery(state: state);
                          }),
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
                          child: SizedBox(
                        height: 54,
                      ))
                    ],
                  );
                });
          }),
          bottomSheet: FilledButton(
            onPressed: () {
              BookRoute(productId: productId).push(context);
            },
            style: FilledButton.styleFrom(fixedSize: Size.fromHeight(54)),
            child: Center(
              child: Text("BOOK A TABLE"),
            ),
          ),
        ),
      ),
    );
  }
}
