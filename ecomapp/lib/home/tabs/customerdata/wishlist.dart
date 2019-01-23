
import 'dart:convert';

import 'package:ecomapp/themedata/Theme.dart' as theme;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Wishlist extends StatefulWidget{

@override
WishlistState createState() => new WishlistState();
}

class WishlistState extends State<Wishlist>{

Map data;
static String token="thesidkhanna@gmail.com";
String url="http://10.177.7.112:8000/wishlist/get?token="+token;
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
      backgroundColor: theme.Colors.productPageBackground,
    appBar: new AppBar(
      backgroundColor: theme.Colors.appBarTitle,
      title: new Text("Wishlist")
    ),
    body: new ListView.builder(
      itemCount: data == null ? 0 : data["product"].length,
      itemBuilder: (BuildContext context,int index){
        return new Card(
          child: Column(
            children:<Widget>[
               new Row(
                 children:<Widget>[
                 new Image.network(data["product"][index]["imageUrl"], 
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
            ]
          )
        );
      },
    ),
    )
  );
}
}