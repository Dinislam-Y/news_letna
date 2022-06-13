// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';

class ImageNewsWidget extends StatelessWidget {
  final String urlImage;
  final double height;
  final double weight;

  const ImageNewsWidget({
    Key? key,
    required this.urlImage,
    this.height = 50,
    this.weight = 80,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: CachedNetworkImage(
        placeholder: (context, url) => Image.asset('assets/no_image.png'),
        imageUrl: urlImage,
        height: height,
        width: weight,
        alignment: Alignment.center,
        fit: BoxFit.cover,
      ),
    );
  }
}
