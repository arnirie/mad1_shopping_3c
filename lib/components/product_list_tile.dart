import 'package:flutter/material.dart';
import 'package:mad1_shopping_3c/helpers/db_helper.dart';
import 'package:mad1_shopping_3c/models/product.dart';

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
    return ListTile(
      title: Text(product.title),
      subtitle: Text(product.description ?? ''),
      trailing: IconButton(
        onPressed: () => deleteItem(product.id),
        icon: const Icon(Icons.delete),
      ),
    );
  }
}
