import 'package:flutter/cupertino.dart';

class ItemCart with ChangeNotifier {
  int _item_counter = 0;
  List _itemListCart = [];

  int getCartCounter() => _item_counter;
  List getItemListCart() => _itemListCart;

  void incrementCartCounter() {
    _item_counter++;
    notifyListeners();
  }

  void decrementCartCounter(item) {
    int index = _itemListCart.indexWhere((itemCart) => itemCart.name == item);
    if (index != -1) {
      int total = _itemListCart[index].total;
      if (total > 0) {
        _item_counter--;
      }
    }

    notifyListeners();
  }

  void addItemToCart(item) {
    int index =
        _itemListCart.indexWhere((itemCart) => itemCart.name == item.name);
    if (index != -1) {
      _itemListCart[index].total++;
    } else {
      var itemDetail = ItemDetail();
      itemDetail.name = item.name;
      itemDetail.description = item.description;
      itemDetail.price = item.price;
      itemDetail.imageThumb = item.imageThumb;
      itemDetail.total++;
      _itemListCart.add(itemDetail);
    }
  }

  void removeItemFromCart(item) {
    int index = _itemListCart.indexWhere((itemCart) => itemCart.name == item);
    if (_itemListCart[index].total > 0) {
      _itemListCart[index].total--;
    }
  }

  String getTotalItem(item) {
    int index = _itemListCart.indexWhere((itemCart) => itemCart.name == item);
    if (index != -1) {
      return _itemListCart[index].total.toString();
    } else {
      return "0";
    }
  }
}

class ItemDetail {
  String? name;
  String? description;
  double? price;
  String? imageThumb;
  int total = 0;
}
