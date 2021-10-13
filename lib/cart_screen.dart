import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/model/items.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/item_cart.dart';

import 'detail_screen.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List itemListCart = context
        .read<ItemCart>()
        .getItemListCart()
        .where((i) => i.total > 0)
        .toList();

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.lightBlueAccent, title: Text('Cart')),
        body: itemListCart.length > 0
            ? Container(
                child: ListView(
                  children: itemListCart.map((item) {
                    return Container(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              bottom: BorderSide(
                            color: Colors.grey,
                          ))),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                height: 100,
                                width: 50,
                                child: Image.asset(item.imageThumb)),
                            Text(item.name,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(
                                'x ${context.watch<ItemCart>().getTotalItem(item.name)}'),
                            Text('\$ ${item.price.toString()}',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    int index = itemList.indexWhere(
                                        (itemCart) =>
                                            itemCart.name == item.name);
                                    return DetailScreen(item: itemList[index]);
                                  }));
                                },
                                icon: Icon(Icons.edit))
                          ]),
                    );
                  }).toList(),
                ),
              )
            : Container(
                child: Center(
                child: Text('Cart is empty',
                    style: TextStyle(fontSize: 24, color: Colors.grey)),
              )));
  }
}
