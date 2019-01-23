
import 'dart:convert';

import 'package:ecomapp/globals/global.dart' as gb;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ecomapp/themedata/Theme.dart' as theme;

class Merchant extends StatefulWidget{

@override
MerchantState createState() => new MerchantState();
}

class MerchantState extends State<Merchant>{


// @override
// Future initState()  => this.getData();
@override
Widget build(BuildContext context)
{
  return new MaterialApp(
    home: new Scaffold(
    appBar: new AppBar(
      backgroundColor: theme.Colors.themeColor,
      title: new Text("Wishlist"),
    ),

    body: new ListView.builder(
      itemCount: gb.productGlobal.merchantName == null ? 0 : gb.productGlobal.merchantName.length,
      itemBuilder: (BuildContext context,int index){
        return new Card(
          //child: new Text(data[index]["productId"]),
          child: Column(
            children:<Widget>[
               new Row(
                 children:<Widget>[
                //  new Image.network(data["product"][index]["imageSrc"], 
                // // new Image.asset("assets/cool-htc-one-wallpapers-4310228.png", 
                //   fit: BoxFit.fitHeight,
                //   height: 150.0,
                //   width: 150.0,),
                  new Column(
                 children:<Widget>[
                  new Text(gb.productGlobal.merchantName[index]),
                  new Text(gb.productGlobal.cost[index].toString()),
                  new Text(gb.productGlobal.merchantRating[index].toString()),
                  new Text(gb.productGlobal.quantityLeftMerchant[index].toString()),
                 ]
              )
                 ]
              )
            // new Text(data["product"][index]["productName"]),
            // new Text(data["product"][index]["productRating"].toString()),
            ]
          )
        );
      },
    ),
    )
  );
}
}