import 'dart:convert';
import 'ProductList.dart';
import 'package:ecomapp/MiniProduct.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'GradientAppBar.dart';



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
        new GradientAppBar("Search Results:"),
        new ProductList(),
      ],
    );
  }
}

