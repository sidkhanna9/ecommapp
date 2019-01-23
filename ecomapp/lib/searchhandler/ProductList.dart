import 'package:ecomapp/searchhandler/ProductRow.dart';
import 'package:flutter/material.dart';
import 'package:ecomapp/globals/global.dart' as gb;
import 'package:ecomapp/themedata/Theme.dart' as theme;
class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return new Flexible(
      child: new Container(
        color: theme.Colors.productPageBackground,
        child: new ListView.builder(
          itemExtent: 160.0,
          itemCount: gb.mp.length,
          itemBuilder: (_, index) => new ProductRow(mini: gb.mp[index]),
        ),
      ),
    );
  }
}