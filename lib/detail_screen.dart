import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/model/items.dart';
import 'package:shop_app/provider/item_cart.dart';
import 'package:shop_app/provider/item_wishlist.dart';

import 'cart_screen.dart';

class DetailScreen extends StatelessWidget {
  final Items item;

  DetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return DetailMobilePage(item: item);
  }
}

class DetailMobilePage extends StatefulWidget {
  final Items item;

  DetailMobilePage({required this.item});
  @override
  _DetailMobilePageState createState() => _DetailMobilePageState();
}

class _DetailMobilePageState extends State<DetailMobilePage> {
  final _scrollController = ScrollController();
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    Provider.of<ItemWishlist>(context, listen: false)
        .checkWishlist(widget.item);
    isFavorite =
        Provider.of<ItemWishlist>(context, listen: false).getWishlistCheck();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        actions: <Widget>[
          Stack(
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return CartScreen();
                          }));
                        },
                        icon: Icon(Icons.shopping_cart))),
              ]),
              if (context.watch<ItemCart>().getCartCounter() == 0)
                ...[]
              else ...[
                Positioned(
                  right: 10,
                  top: 5,
                  child: Container(
                    width: 25.0,
                    height: 25.0,
                    decoration: new BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("${context.watch<ItemCart>().getCartCounter()}")
                        ]),
                  ),
                )
              ]
            ],
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(fit: StackFit.expand, children: [
        Positioned(
          left: 20,
          top: 100,
          child: FloatingActionButton(
            heroTag: 'Wishlist',
            onPressed: () {
              int idx = itemList.indexWhere((i) => i.name == widget.item.name);
              context.read<ItemWishlist>().addWishlistItem(itemList[idx]);
              setState(() => isFavorite = !isFavorite);
            },
            backgroundColor: Colors.lightBlueAccent,
            child: Icon(
              Icons.favorite,
              color: isFavorite ? Colors.red : Colors.white,
              size: 40,
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: screenSize.width > 500 ? screenSize.width / 3 : 40,
          child: FloatingActionButton(
            heroTag: 'Add to Cart',
            onPressed: () {
              context.read<ItemCart>().incrementCartCounter();
              context.read<ItemCart>().addItemToCart(widget.item);
            },
            backgroundColor: Colors.lightBlueAccent,
            child: Icon(Icons.add_shopping_cart),
          ),
        ),
        Positioned(
          bottom: 20,
          left: screenSize.width > 500 ? screenSize.width / 3 : 40,
          child: FloatingActionButton(
            heroTag: 'Remove from Cart',
            onPressed: () {
              context.read<ItemCart>().decrementCartCounter(widget.item.name);
              context.read<ItemCart>().removeItemFromCart(widget.item.name);
            },
            backgroundColor: Colors.lightBlueAccent,
            child: Icon(Icons.remove_shopping_cart),
          ),
        ),
        Positioned(
            bottom: 30,
            right: screenSize.width / 2 - 30,
            child: Container(
                width: 60,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.lightBlueAccent,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blueGrey,
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(3, 4)),
                  ],
                ),
                child: Center(
                    child: Text(
                        context.read<ItemCart>().getTotalItem(widget.item.name),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))))),
      ]),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.only(bottom: 80),
            constraints: BoxConstraints(maxWidth: 800),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 300,
                  child: Scrollbar(
                    controller: _scrollController,
                    child: ListView(
                      controller: _scrollController,
                      padding: const EdgeInsets.all(10.0),
                      scrollDirection: Axis.horizontal,
                      children: widget.item.imageItems.map((images) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              images,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("${widget.item.name}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21.0,
                        ))),
                Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("${widget.item.description}")),
                Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("\$ ${widget.item.price}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
