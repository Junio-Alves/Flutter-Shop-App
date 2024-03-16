import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';

class ProductList with ChangeNotifier {
  final List<Product> _items = dummyProducts;
  List<Product> get items => [..._items];
  List<Product> get favoriteItems =>
      items.where((product) => product.isFavorite).toList();

  int get itemsCount {
    return items.length;
  }

  void addProductFromData(Map<String, Object> data) {
    final newProduct = Product(
      id: Random().nextDouble().toString(),
      name: data["name"] as String,
      description: data["description"] as String,
      price: data["price"] as double,
      imageUrl: data["imageUrl"] as String,
    );
    addProduct(newProduct);
    notifyListeners();
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners();
  }
}

//  List<Product> get items {
//     if (_showFavoriteOnly) {
//       return _items.where((product) => product.isFavorite).toList();
//     } else {
//       return [..._items];
//     }
//   }

//   void showFavoriteOnly() {
//     _showFavoriteOnly = true;
//     notifyListeners();
//   }

//   void showAll() {
//     _showFavoriteOnly = false;
//     notifyListeners();
//   }
