
import 'dart:convert';

import 'package:ecomapp/home/home_page.dart';
import 'package:ecomapp/home/tabs/welcome.dart';
import 'package:ecomapp/themedata/Theme.dart' as theme;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:ecomapp/globals/global.dart' as gb;

class Place extends StatelessWidget{

// @override
// PlaceState createState() => new PlaceState();
// }

// class PlaceState extends State<Place>{


  final addressController=TextEditingController();
//Map data;
String url=gb.getAddress+gb.session.emailId;

Future<String> getData() async {

print("****\n\n\n\n\n"+gb.product.toString());
Map map = {
    'inventoryId':gb.data['product'][gb.index]['inventoryId'],
    'customerId':gb.session.emailId,
    'address':addressController.text,
    'quantity':gb.data['product'][gb.index]['quantity'],
  };

http.Response response = await http.post(Uri.encodeFull(gb.hostip+gb.orderUrl),
headers: gb.postHeader,
body: utf8.encode(json.encode(map))
);

http.Response response1= await http.delete(Uri.encodeFull("http://10.177.7.88:7000/cart/item/delete?token="+gb.session.emailId+"&id="+gb.data['product'][gb.index]['inventoryId']));
var jsonData=json.decode(response.body);
//var status=jsonData['status'];
//print(jsonData['status']);
if(response.statusCode == 200)
{
  
  Fluttertoast.instance.showToast(
        msg: "Order placed"  ,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        backgroundColor: Colors.grey,
        textColor: Colors.white);
        }

else
    {
    

       Fluttertoast.instance.showToast(
        msg: "Order failed "  +jsonData['message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        backgroundColor: Colors.grey,
        textColor: Colors.white);     
    }

}


@override
Widget build(BuildContext context)
{
  return new MaterialApp(
    home: new Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: theme.Colors.productPageBackground,
            
    body: new TextFormField(
                  controller: addressController,
                  decoration: new InputDecoration(
                      labelText : "Enter Address",
                    ),
    ),
      bottomNavigationBar: BottomAppBar(
        //hasNotch: false,
        child:  RaisedButton(
                  color: Colors.teal,
                  textColor: Colors.white,
                  child: new Text("Place your order"),
                  onPressed: (){
                    getData();
                  },
                  splashColor: Colors.redAccent,
                ),
        
     ),
    )
  );
}
}