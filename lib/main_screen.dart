import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/detail_screen.dart';
import 'package:shop_app/model/items.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/item_cart.dart';
import 'package:shop_app/search_screen.dart';

import 'cart_screen.dart';
import 'model/categories.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                  child: Container(
                width: screenSize.width,
                height: screenSize.height / 2,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/hero.jpg',
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      left: 20,
                      bottom: 50,
                      child: Text(
                        'New Arrivals',
                        style: TextStyle(
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(4.0, 4.0),
                                blurRadius: 8.0,
                                color: Colors.black54,
                              ),
                            ],
                            fontSize: 42.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Oswald',
                            color: Colors.white),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      bottom: 20,
                      child: Text(
                        'Discover  >',
                        style: TextStyle(
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(4.0, 4.0),
                                blurRadius: 8.0,
                                color: Colors.black54,
                              ),
                            ],
                            fontSize: 24.0,
                            fontFamily: 'Oswald',
                            color: Colors.white),
                      ),
                    ),
                    Positioned(
                      right: 60,
                      top: 10,
                      child: IconButton(
                        iconSize: 30.0,
                        icon: Icon(Icons.search),
                        tooltip: 'Search item',
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SearchScreen();
                          }));
                        },
                      ),
                    ),
                    Positioned(
                      right: 20,
                      top: 10,
                      child: IconButton(
                        iconSize: 30.0,
                        icon: Icon(Icons.shopping_cart),
                        tooltip: 'cart',
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return CartScreen();
                          }));
                        },
                      ),
                    ),
                    if (context.watch<ItemCart>().getCartCounter() == 0)
                      ...[]
                    else ...[
                      Positioned(
                        right: 15,
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
                                Text(
                                    "${context.watch<ItemCart>().getCartCounter()}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ))
                              ]),
                        ),
                      )
                    ],
                  ],
                ),
              )),
              Flexible(
                child: Center(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 800),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Categories',
                            style: TextStyle(
                                fontSize: 22.0, fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 180,
                          child: Center(
                            child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: categoryList.map((category) {
                                  return Container(
                                      padding: EdgeInsets.only(left: 20),
                                      width: 150,
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                                category.imageThumb,
                                                fit: BoxFit.cover),
                                          ),
                                          Positioned(
                                              left: 10,
                                              bottom: 10,
                                              child: Text(category.name,
                                                  style: TextStyle(
                                                      shadows: <Shadow>[
                                                        Shadow(
                                                          offset:
                                                              Offset(4.0, 4.0),
                                                          blurRadius: 8.0,
                                                          color: Colors.black,
                                                        ),
                                                      ],
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600)))
                                        ],
                                      ));
                                }).toList()),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text('Recommended for you',
                              style: TextStyle(
                                  fontSize: 21.0, fontWeight: FontWeight.w600)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            child: screenSize.width > 360
                                ? ItemListGrid(gridCount: 2)
                                : ItemListGrid(gridCount: 1)),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ItemListGrid extends StatelessWidget {
  final int gridCount;

  ItemListGrid({required this.gridCount});
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: gridCount,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: itemList.map((item) {
            return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailScreen(item: item);
                  }));
                },
                child: Card(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                      Expanded(
                        child: Image.asset(item.imageThumb, fit: BoxFit.cover),
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
                          padding:
                              const EdgeInsets.only(left: 8.0, bottom: 8.0),
                          child: Text('\$ ${item.price.toString()}'))
                    ])));
          }).toList(),
        ));
  }
}
