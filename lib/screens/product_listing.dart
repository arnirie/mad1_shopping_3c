import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mad1_shopping_3c/components/app_drawer.dart';
import 'package:mad1_shopping_3c/components/product_grid_tile.dart';
import 'package:mad1_shopping_3c/helpers/db_helper.dart';
import 'package:mad1_shopping_3c/models/product.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ProductListingScreen extends StatefulWidget {
  const ProductListingScreen({super.key});

  @override
  State<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  void toggleFavorite(Product p) async {
    p.isFavorite = !p.isFavorite;
    DbHelper.updateProduct(p);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Listing'),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              print(value);
              if (value == 0) {
              } else {}
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                value: 0,
                child: Text('Favorites'),
              ),
              PopupMenuItem(
                value: 1,
                child: Text('Show All'),
              ),
            ],
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: DbHelper.fetchQuery(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          var products = snapshot.data;
          if (products == null) {
            return const Center(
              child: Text('No Products Found'),
            );
          }
          print('products lenght: ${products.length}');
          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (_, index) {
              Product p = Product(
                id: products[index][DbHelper.colId],
                title: products[index][DbHelper.colTitle],
                price:
                    double.parse(products[index][DbHelper.colPrice].toString()),
                description: products[index][DbHelper.colDescription],
                imageUrl: products[index][DbHelper.colImageUrl],
                isFavorite:
                    products[index][DbHelper.colIsFavorite] == 1 ? true : false,
              );
              return ProductGridTile(
                product: p,
                toggleFavorite: toggleFavorite,
              );
            },
            itemCount: products.length,
          );
        },
      ),
    );
  }
}
