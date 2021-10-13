import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemWishlist extends ChangeNotifier {
  bool _isChecked = false;
  List _wishlistItems = [];

  List getWishlistItems() => _wishlistItems;
  bool getWishlistCheck() => _isChecked;

  void addWishlistItem(item) {
    int index = _wishlistItems.indexWhere((i) => i.name == item.name);
    if (index == -1) {
      _wishlistItems.add(item);
      _isChecked = true;
    } else {
      _wishlistItems.removeAt(index);
    }
    notifyListeners();
  }

  void checkWishlist(item) {
    int index = _wishlistItems.indexWhere((i) => i.name == item.name);
    if (index != -1) {
      _isChecked = true;
    } else {
      _isChecked = false;
    }
  }
}
