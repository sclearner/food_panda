part of 'product_page.dart';

class ProductPhotoGallery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text("PHOTOS"),
        ),
        PhotoGallery()
      ],
    );
  }
}
