import 'package:app_dev_assign2/products/models/products_model.dart';
import 'package:app_dev_assign2/products/providers/products_provider.dart';
import 'package:app_dev_assign2/products/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String selectedCategory = "All";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProvider>(context, listen: false).getAllProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final allProducts = productProvider.products;

    List<ProductModel> filteredProducts = selectedCategory == "All"
        ? allProducts
        : allProducts.where((p) => p.category == selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Products", style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Category Filter Buttons
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _categoryButton("All"),
                _categoryButton("electronics"),
                _categoryButton("jewelery"),
                _categoryButton("men's clothing"),
                _categoryButton("women's clothing"),
              ],
            ),
          ),
          Expanded(
            child: productProvider.isLoading
                ? _buildShimmerGrid() // Use shimmer effect while loading
                : GridView.builder(
                    padding: EdgeInsets.all(10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      return _productCard(context, product);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  // Category Button
  Widget _categoryButton(String category) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ChoiceChip(
        label: Text(category),
        selected: selectedCategory == category,
        onSelected: (selected) {
          setState(() {
            selectedCategory = category;
          });
        },
      ),
    );
  }

  // Shimmer Loading Effect (Grid Style)
  Widget _buildShimmerGrid() {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: 6, // Show shimmer placeholders
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
    );
  }

  // Product Card
  Widget _productCard(BuildContext context, ProductModel product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetailScreen(product: product)),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.network(product.image,
                    width: double.infinity, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "\$${product.price}",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  _buildRatingStars(product.rating),
                  SizedBox(width: 5),
                  Text("(${product.ratingCount})"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Star Rating
  Widget _buildRatingStars(double rating) {
    int fullStars = rating.floor();
    bool halfStar = rating - fullStars >= 0.5;
    return Row(
      children: List.generate(5, (index) {
        if (index < fullStars) {
          return Icon(Icons.star, color: Colors.amber, size: 16);
        } else if (halfStar && index == fullStars) {
          return Icon(Icons.star_half, color: Colors.amber, size: 16);
        } else {
          return Icon(Icons.star_border, color: Colors.grey, size: 16);
        }
      }),
    );
  }
}
