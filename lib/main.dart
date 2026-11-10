import 'package:flutter/material.dart';
import 'shopping_cart_page.dart';

void main() {
  runApp(const CampusStoreApp());
}

class CampusStoreApp extends StatelessWidget {
  const CampusStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1D5CFF)),
        useMaterial3: true,
      ),
      home: const ShoppingCartPage(),
    );
  }
}
