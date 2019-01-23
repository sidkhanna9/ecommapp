
import 'dart:convert';

import 'package:ecomapp/home/home_page.dart';
import 'package:ecomapp/home/tabs/welcome.dart';
import 'package:ecomapp/themedata/Theme.dart' as theme;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ecomapp/globals/global.dart' as gb;

class Place extends StatefulWidget{

@override
PlaceState createState() => new PlaceState();
}

class PlaceState extends State<Place>{

Map data;
String url=gb.getAddress+gb.token;
Future<String> getData() async{
  
  http.Response response= await http.get(
    Uri.encodeFull(url),
  headers:gb.getHeader
  );

print(url);
  this.setState((){
data = json.decode(response.body);
print(data['addressList'].length);
  });
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
      resizeToAvoidBottomPadding: false,
      backgroundColor: theme.Colors.productPageBackground,
            
    body: new ListView.builder(
      itemCount: data == null ? 0 : data['addressList'].length,
      itemBuilder: (BuildContext context,int index){
         return new Card(
          //child: new Text(data[index]["productId"]),
          child: Column(
            children:<Widget>[
          
                  new Text(data['addressList'][index]["addressLine1"]),
                  new Text(data['addressList'][index]["addressLine2"]),
                  new Text(data['addressList'][index]["city"]),
                  new Text(data['addressList'][index]["zipCode"]),
                  new Text(data['addressList'][index]["state"]),
                  new Text(data['addressList'][index]["country"]),
                 ]
              ),
               
            
          
        );
         
      },  
    ),
      bottomNavigationBar: BottomAppBar(
        //hasNotch: false,
        child:  RaisedButton(
                  color: Colors.teal,
                  textColor: Colors.white,
                  child: new Text("Place your order"),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Welcome();
                    }));
                  },
                  splashColor: Colors.redAccent,
                ),
        
     ),
    )
  );
}
}