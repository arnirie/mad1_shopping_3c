import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mad1_shopping_3c/helpers/db_helper.dart';
import 'package:mad1_shopping_3c/models/product.dart';
import 'package:mad1_shopping_3c/screens/product_addedit.dart';

class ProductListTile extends StatelessWidget {
  ProductListTile({
    super.key,
    required this.product,
    required this.deleteItem,
  });

  Product product;
  Function(int id) deleteItem;

  @override
  Widget build(BuildContext context) {
    print(product.imageUrl);
    return ListTile(
      leading: CircleAvatar(
        child: product.imageUrl == null || product.imageUrl!.isEmpty
            ? Image.asset('assets/images/product-icon.jpg')
            : FadeInImage.assetNetwork(
                placeholder: 'assets/images/product-icon.jpg',
                image: product.imageUrl ?? ''),
      ),
      title: Text(product.title),
      subtitle: Text(product.description ?? ''),
      trailing: IconButton(
        onPressed: () => deleteItem(product.id),
        icon: const Icon(Icons.delete),
      ),
    );
  }
}
