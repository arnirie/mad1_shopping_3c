import 'package:flutter/material.dart';
import 'package:mad1_shopping_3c/components/app_drawer.dart';
import 'package:mad1_shopping_3c/helpers/db_helper.dart';
import 'package:mad1_shopping_3c/models/product.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ProductListingScreen extends StatelessWidget {
  const ProductListingScreen({super.key});

  void addItem() async {
    var product = Product(
      id: 100,
      title: 'Pouch Bag',
      price: 2500.0,
      description: 'new pouch bag',
      isFavorite: false,
    );
    DbHelper.insertProduct(product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Listing'),
      ),
      drawer: AppDrawer(),
      // body: ElevatedButton(
      //   onPressed: addItem,
      //   child: const Text('ADD'),
      // ),
    );
  }
}
