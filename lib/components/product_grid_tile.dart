import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mad1_shopping_3c/models/product.dart';
import 'package:mad1_shopping_3c/screens/product_details.dart';

class ProductGridTile extends StatelessWidget {
  ProductGridTile(
      {super.key, required this.product, required this.toggleFavorite});

  Product product;
  Function(Product p) toggleFavorite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (_) => ProductDetailsScreen(
              product: product,
            ),
          ),
        );
      },
      child: GridTile(
        header: GridTileBar(
          leading: IconButton(
            onPressed: () => toggleFavorite(product),
            icon: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_outline,
              color: Colors.red,
            ),
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black45,
          title: Text(product.title),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
          ),
        ),
        child: product.imageUrl == null || product.imageUrl!.isEmpty
            ? const Center(
                child: Text('No image'),
              )
            : FadeInImage.assetNetwork(
                placeholder: 'assets/images/product-icon.jpg',
                image: product.imageUrl!),
      ),
    );
  }
}
