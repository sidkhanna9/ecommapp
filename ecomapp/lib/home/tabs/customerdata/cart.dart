
import 'dart:convert';

import 'package:ecomapp/globals/global.dart' as gb;
import 'package:ecomapp/home/tabs/customerdata/place.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ecomapp/themedata/Theme.dart' as theme;

class Cart extends StatefulWidget{

@override
CartState createState() => new CartState();
}

class CartState extends State<Cart>{

String url=gb.getCartURL+gb.session.emailId;
Future<String> getData() async{
  
  http.Response response= await http.get(
    Uri.encodeFull(url),
    
  headers:gb.getHeader
  );


print("\n\n\n"+response.toString());

  this.setState((){
gb.data = json.decode(response.body);
  });
  print(gb.data);
  return "SUCCESS";
}
@override
  void initState() {
    super.initState();
    getData();

  }
@override
Widget build(BuildContext context)
{
  return new MaterialApp(
    home: new Scaffold(
      backgroundColor: theme.Colors.productPageBackground,
    appBar: new AppBar(
      backgroundColor: theme.Colors.appBarTitle,
      title: new Text("Cart"),
    ),

    body: new ListView.builder(
      itemCount: gb.data == null ? 0 : gb.data["product"].length,
      itemBuilder: (BuildContext context,int index){
         return new Card(
          //child: new Text(data[index]["productId"]),
          child: Column(
            children:<Widget>[
               new Row(
                 children:<Widget>[
                 new Image.network(gb.data["product"][index]["imageSrc"], 
                  fit: BoxFit.fitHeight,
                  height: 150.0,
                  width: 150.0,),
                  new Column(
                 children:<Widget>[
                  new Text(gb.data["product"][index]["productName"],
                  ),
             new Text(gb.data["product"][index]["price"].toString()),
             new Text(gb.data["product"][index]["quantity"].toString()),
             new RaisedButton(
              child: new Text('Place your order'),
              onPressed: () {
                gb.index=index;
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new Place()),
                );
              },
            ),
                 ]
              ),
              
                 ]
              ),
               
            ]
          ),
        );
         
      },  
    ),
    )
  );
}
}