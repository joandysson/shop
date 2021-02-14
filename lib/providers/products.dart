import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/providers/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = DUMMY_PRODUCT;

  List<Product> get items => [..._items];

  int get itemsCount => _items.length;

  List<Product> get favoriteItems =>
      _items.where((prod) => prod.isFavorite).toList();

  void addProduct(Product newProduct) {
    _items.add(
      Product(
        id: Random().nextDouble().toString(),
        title: newProduct.title,
        price: newProduct.price,
        description: newProduct.description,
        imageUrl: newProduct.imageUrl,
      ),
    );
    notifyListeners();
  }

  void updateProduct(Product product) {
    if (product == null && product.id == null) return;

    final index = _items.indexWhere((prod) => prod.id == product.id);
    if (index >= 0) {
      _items[index] = product;
      notifyListeners();
    }
  }

  void deleteProduct(String id) {
    final index = _items.indexWhere((prod) => prod.id == id);

    if (index >= 0) {
      _items.removeWhere((prod) => prod.id == id);
      notifyListeners();
    }
  }
}
