import 'package:app_dev_assign2/products/providers/products_provider.dart';
import 'package:app_dev_assign2/products/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData.dark(useMaterial3: true),
        home: ProductsScreen(),
      ),
    );
  }
}
