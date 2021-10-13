import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/widget/search_widget.dart';
import 'detail_screen.dart';
import 'model/items.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List allItems;
  String query = '';

  @override
  void initState() {
    super.initState();

    allItems = itemList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.lightBlueAccent, title: Text('Search')),
        body: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 800),
            child: Column(
              children: [
                buildSearch(),
                Expanded(
                    child: ListView(
                        children: allItems.map((item) {
                  return ListTile(
                      leading: Image.asset(item.imageThumb,
                          fit: BoxFit.cover, width: 50, height: 50),
                      title: Text(item.name),
                      subtitle: Text('\$ ${item.price.toString()}'),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailScreen(item: item);
                        }));
                      });
                }).toList()))
              ],
            ),
          ),
        ));
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Search item...',
        onChanged: searchItem,
      );

  void searchItem(String query) {
    final allItems = itemList.where((item) {
      final titleLower = item.name.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.allItems = allItems;
    });
  }
}
