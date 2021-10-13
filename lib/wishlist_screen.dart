import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/provider/item_wishlist.dart';
import 'package:provider/provider.dart';

import 'detail_screen.dart';

class WishlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.lightBlueAccent, title: Text('Wishlist')),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: 800),
                  child: screenSize.width < 800
                      ? WishlistGridView(gridCount: 2)
                      : WishlistGridView(gridCount: 3),
                ),
              )
            ],
          ),
        ));
  }
}

class WishlistGridView extends StatefulWidget {
  final int gridCount;

  WishlistGridView({required this.gridCount});

  @override
  _WishlistGridViewState createState() => _WishlistGridViewState();
}

class _WishlistGridViewState extends State<WishlistGridView> {
  @override
  Widget build(BuildContext context) {
    List wishlistItems = context.read<ItemWishlist>().getWishlistItems();
    Size screenSize = MediaQuery.of(context).size;
    return wishlistItems.length > 0
        ? Padding(
            padding: const EdgeInsets.all(24.0),
            child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: widget.gridCount,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: wishlistItems.map((item) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailScreen(item: item))).then((value) {
                          setState(() {
                            // refresh this Page
                          });
                        });
                      },
                      child: Card(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                            Expanded(
                              child: Image.asset(item.imageThumb,
                                  fit: BoxFit.cover),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(item.name,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold))),
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, bottom: 8.0),
                                child: Text('\$ ${item.price.toString()}'))
                          ])));
                }).toList()))
        : Container(
            height: screenSize.height - 110,
            child: Center(
              child: Text('You have no wishlist',
                  style: TextStyle(fontSize: 24, color: Colors.grey)),
            ));
  }
}
