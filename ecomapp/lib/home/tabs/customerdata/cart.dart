
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Cart extends StatefulWidget{

@override
CartState createState() => new CartState();
}

class CartState extends State<Cart>{

Map data;
static String token="spdipali@gmail.com";
String url="http://10.177.7.88:7000/cart/get?token="+token;
Future<String> getData() async{
  
  http.Response response= await http.get(
    Uri.encodeFull(url),
    
  headers:{
    "Accept": "application/json"
  }
  );

print(url);
  this.setState((){
data = json.decode(response.body)[0];
  });
  print(data["product"][0]["imageUrl"]);
  return "SUCCESS";
}

@override
void initState(){
  this.getData();
}
@override
Widget build(BuildContext context)
{
  return new MaterialApp(
    home: new Scaffold(
    appBar: new AppBar(
      title: new Text("Wishlist")
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
                 new Image.network(data["product"][index]["imageUrl"], 
                // new Image.asset("assets/cool-htc-one-wallpapers-4310228.png", 
                  fit: BoxFit.fitHeight,
                  height: 150.0,
                  width: 150.0,),
                  new Column(
                 children:<Widget>[
                  new Text(data["product"][index]["productName"],
                  ),
             new Text(data["product"][index]["productRating"].toString()),
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