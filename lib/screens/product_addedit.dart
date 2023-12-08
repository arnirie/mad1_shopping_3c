import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mad1_shopping_3c/components/app_drawer.dart';
import 'package:mad1_shopping_3c/models/product.dart';

class ProductAddEditScreen extends StatefulWidget {
  ProductAddEditScreen(
      {super.key, required this.operation, this.passedProduct});

  Function(Product p) operation;
  Product? passedProduct;

  @override
  State<ProductAddEditScreen> createState() => _ProductAddEditScreenState();
}

class _ProductAddEditScreenState extends State<ProductAddEditScreen> {
  final formKey = GlobalKey<FormState>();
  final product = Product.empty();

  final titleController = TextEditingController();
  final descController = TextEditingController();
  final priceController = TextEditingController();
  final imageController = TextEditingController();

  void saveItem() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    formKey.currentState!.save();
    widget.operation(product);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.passedProduct != null) {
      product.id = widget.passedProduct!.id;
      titleController.text = widget.passedProduct!.title;
      descController.text = widget.passedProduct?.description ?? '';
      priceController.text = widget.passedProduct!.price.toString();
      imageController.text = widget.passedProduct?.imageUrl ?? '';
    }
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.passedProduct == null ? 'Add Product' : 'Edit Product'),
        actions: [
          IconButton(
            onPressed: saveItem,
            icon: const Icon(Icons.save),
          )
        ],
      ),
      // drawer: AppDrawer(),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                label: Text('Title'),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                print(value);
              },
              onSaved: (newValue) {
                product.title = newValue!;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '*Required field.';
                }
                return null;
              },
            ),
            const Gap(8),
            TextFormField(
              controller: descController,
              decoration: const InputDecoration(
                label: Text('Description'),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: 3,
              onSaved: (newValue) {
                product.description = newValue;
              },
            ),
            const Gap(8),
            TextFormField(
              controller: priceController,
              decoration: const InputDecoration(
                label: Text('Price'),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '*Required field.';
                }
                var ans = double.tryParse(value);
                if (ans == null) {
                  return '*Enter a valid amount';
                }
                return null;
              },
              onSaved: (newValue) {
                product.price = double.parse(newValue!);
              },
            ),
            const Gap(8),
            TextFormField(
              controller: imageController,
              decoration: const InputDecoration(
                label: Text('Image URL'),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onSaved: (newValue) {
                product.imageUrl = newValue;
              },
            ),
          ],
        ),
      ),
    );
  }
}
