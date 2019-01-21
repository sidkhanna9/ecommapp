import 'package:flutter/material.dart';
import 'package:ecomapp/Theme.dart' as Theme;
import 'package:ecomapp/home_page.dart';
import 'package:ecomapp/ProductRow.dart';
class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Flexible(
      child: new Container(
        color: Theme.Colors.productPageBackground,
        child: new ListView.builder(
          itemExtent: 160.0,
          itemCount: mp.length,
          itemBuilder: (_, index) => new ProductRow(mini: mp[index]),
        ),
      ),
    );
  }
}