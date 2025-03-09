import 'package:app_dev_assign2/products/models/products_model.dart';
import 'package:app_dev_assign2/products/screens/widgets/rating_stars.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  final ProductModel product;

  const ProductInfo({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            "\$${product.price}",
            style: const TextStyle(
                fontSize: 22, color: Colors.green, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              RatingStars(rating: product.rating),
              const SizedBox(width: 5),
              Text("(${product.ratingCount})"),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            product.description,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
