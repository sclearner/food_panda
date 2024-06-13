import 'package:flutter/material.dart';
import 'package:food_panda/blocs/product_bloc/product_bloc.dart';

class ProductCoverGallery extends StatefulWidget {
  ProductState state;

  ProductCoverGallery({super.key, required this.state});

  @override
  State<ProductCoverGallery> createState() => _ProductCoverGalleryState();
}

class _ProductCoverGalleryState extends State<ProductCoverGallery> {
  int _imageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(const Duration(seconds: 15), (i) {
          setState(() {
            _imageIndex++;
            if (_imageIndex >= widget.state.menu!.gallery!.length) {
              _imageIndex = 0;
            }
          });
          return _imageIndex;
        }),
        builder: (context, snapshot) {
          return AnimatedContainer(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        NetworkImage(widget.state.menu!.gallery![_imageIndex]),
                    fit: BoxFit.cover)),
            duration: Duration(milliseconds: 1000),
          );
        });
  }
}
