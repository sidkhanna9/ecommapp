
import 'dart:convert';

import 'package:ecomapp/globals/global.dart' as gb;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ecomapp/themedata/Theme.dart' as theme;

class Cart extends StatefulWidget{

@override
CartState createState() => new CartState();
}

class CartState extends State<Cart>{

Map data;
String url=gb.getCartURL+gb.token;

Future<String> getData() async{
  
  http.Response response= await http.get(
    Uri.encodeFull(url),
    
  headers:gb.getHeader
  );

print(url);
  this.setState((){
data = json.decode(response.body);
  });
  print(data);
  return "SUCCESS";
}
@override
  void initState() {
    super.initState();
    getData();

  }
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
      itemCount: data == null ? 0 : data["product"].length,
      itemBuilder: (BuildContext context,int index){
        return new Card(
          //child: new Text(data[index]["productId"]),
          child: Column(
            children:<Widget>[
               new Row(
                 children:<Widget>[
                 new Image.network(data["product"][index]["imageSrc"], 
                // new Image.asset("assets/cool-htc-one-wallpapers-4310228.png", 
                  fit: BoxFit.fitHeight,
                  height: 150.0,
                  width: 150.0,),
                  new Column(
                 children:<Widget>[
                  new Text(data["product"][index]["productName"],
                  ),
             new Text(data["product"][index]["price"].toString()),
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