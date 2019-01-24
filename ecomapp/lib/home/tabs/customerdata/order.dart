
import 'dart:convert';

import 'package:ecomapp/globals/global.dart' as gb;
import 'package:ecomapp/searchhandler/Orders.dart';
import 'package:ecomapp/themedata/Theme.dart' as theme;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Order extends StatefulWidget{

@override
OrderState createState() => new OrderState();
}

class OrderState extends State<Order>{

var data;
String url=gb.hostip+":13000/order/customer/get?token="+gb.session.emailId;
Future<String> getData() async{
  
  http.Response response= await http.get(
    Uri.encodeFull(url),
    
  headers:{
    "Accept": "application/json"
  }
  );

print(response.toString());
print(url);
  this.setState((){
data = json.decode(response.body);
  });
  gb.o.clear();
  for(var v in data)
  {
    Orders tmp=new Orders();
    tmp.productId=v['productId'];
    tmp.orderId=v['orderId'];
    tmp.merchantId=v['merchantId'];
    tmp.inventoryId=v['inventoryId'];
    tmp.price=v['price'];
    tmp.modeOfPayment=v['modeOfPayment'];
    tmp.address=v['address'];
    tmp.orderRating=v['orderRating'];
    tmp.status=v['status'];
    tmp.quantity=v['quantity'];
    gb.o.add(tmp);
    print(tmp);
  }
  print(data);
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
    body: new ListView.builder(
      itemCount: data == null ? 0 : data.length,
      itemBuilder: (BuildContext context,int index){
        return new Card(
          child: Column(
            children:<Widget>[
                  new Column(
                 children:<Widget>[
                  new Text(data[index]['price'].toString()),
             new Text(data[index]['modeOdPayment'].toString()),
             new Text(data[index]['address'].toString()),
             new Text(data[index]['status'].toString()),
             new Text(data[index]['quantity'].toString()),
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