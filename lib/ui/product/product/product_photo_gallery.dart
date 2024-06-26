part of 'product_page.dart';

class ProductPhotoGallery extends StatelessWidget {
  const ProductPhotoGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state.menu?.gallery == null) return SizedBox();
        if (state.menu!.gallery!.isEmpty) return SizedBox();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text("PHOTOS"),
            ),
            PhotoGallery(images: state.menu!.gallery!,)
          ],
        );
      }
    );
  }
}
