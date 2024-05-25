import 'package:flutter/material.dart';

class PhotoGallery extends StatelessWidget {
  final double? size;

  const PhotoGallery({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: size ?? 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) => Padding(
            padding: const EdgeInsets.all(10),
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6XvpvndsBxz91yLchUbmiHEGFl9r7XOY2dswC1bLikQ&s'),
            ),
          )),
    );
  }
}