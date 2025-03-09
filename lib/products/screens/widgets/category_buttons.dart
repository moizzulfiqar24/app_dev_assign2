import 'package:flutter/material.dart';

class CategoryButtons extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const CategoryButtons({
    Key? key,
    required this.selectedCategory,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = [
      "All",
      "electronics",
      "jewelery",
      "men's clothing",
      "women's clothing"
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ChoiceChip(
              label: Text(category),
              selected: selectedCategory == category,
              onSelected: (selected) {
                if (selected) {
                  onCategorySelected(category);
                }
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
