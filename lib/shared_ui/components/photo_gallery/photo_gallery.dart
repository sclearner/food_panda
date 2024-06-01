import 'package:flutter/material.dart';

class PhotoGallery extends StatelessWidget {
  final double? size;
  final List<String> images;

  const PhotoGallery({super.key, this.size, required this.images});

  @override
  Widget build(BuildContext context) {
   return SizedBox(
      height: size ?? 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (context, i) => Padding(
            padding: const EdgeInsets.all(10),
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.network(images[i], fit: BoxFit.cover,),
            ),
          )),
    );
  }
}