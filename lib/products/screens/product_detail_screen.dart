import 'package:app_dev_assign2/products/models/products_model.dart';
import 'package:app_dev_assign2/products/screens/widgets/product_image.dart';
import 'package:app_dev_assign2/products/screens/widgets/product_info.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductImage(imageUrl: product.image),
            ProductInfo(product: product),
          ],
        ),
      ),
    );
  }
}
