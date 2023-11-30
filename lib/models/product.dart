import 'package:mad1_shopping_3c/helpers/db_helper.dart';

class Product {
  int id;
  String title;
  String? description;
  double price;
  String? imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    this.description,
    required this.price,
    this.imageUrl,
    this.isFavorite = false,
  });

  //utility method toMap - convert obj to map
  Map<String, dynamic> toMap() {
    return {
      DbHelper.colId: id,
      DbHelper.colTitle: title,
      DbHelper.colDescription: description,
      DbHelper.colPrice: price,
      DbHelper.colImageUrl: imageUrl,
      DbHelper.colIsFavorite: isFavorite ? 1 : 0,
    };
  }

  Map<String, dynamic> toMapWithoutId() {
    return {
      // DbHelper.colId: id,
      DbHelper.colTitle: title,
      DbHelper.colDescription: description,
      DbHelper.colPrice: price,
      DbHelper.colImageUrl: imageUrl,
      DbHelper.colIsFavorite: isFavorite ? 1 : 0,
    };
  }
}
