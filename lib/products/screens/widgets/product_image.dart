import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String imageUrl;

  const ProductImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250, // Adjust height if necessary
      child: Image.network(imageUrl, fit: BoxFit.cover),
    );
  }
}
