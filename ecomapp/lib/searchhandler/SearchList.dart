
import 'ProductList.dart';
import 'package:flutter/material.dart';
import 'package:ecomapp/globals/global.dart' as gb;
import 'package:ecomapp/themedata/GradientAppBar.dart';
class SearchList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SearchListBody(),
    );
  }
}

class SearchListBody extends StatefulWidget {
  @override
  SearchListBodyState createState() => new SearchListBodyState();
}

class SearchListBodyState extends State<SearchListBody> {


  @override
  Widget build(BuildContext context) {
  
    return new Column(
      children: <Widget>[
        new GradientAppBar("Showing Results for\n"+gb.searchQuery),
        new ProductList(),
      ],
    );
  }
}

