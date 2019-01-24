
import 'dart:convert';

import 'package:ecomapp/Login/login.dart';
import 'package:ecomapp/globals/global.dart' as gb;
import 'package:ecomapp/home/tabs/customerdata/place.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:ecomapp/themedata/Theme.dart' as theme;

class Cart extends StatefulWidget{

@override
CartState createState() { 
  
  print("State creation");
  return new CartState();}
}


final addressController=TextEditingController();
String url=gb.getCartURL+gb.session.emailId;


class CartState extends State<Cart>{



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
    if(gb.session.emailId!=null){
    getData();
    print("lol");
    
    }
  }
@override
Widget build(BuildContext context)
{
  print("Yaha aaye");
  if(gb.session.emailId!=null){
    print("Pehla if");
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
                         showDialog(
         // context:context,
         context:context,
          builder: (BuildContext context){
return AlertDialog(

  content: SingleChildScrollView(
    child: ListBody(
      children: <Widget>[
                    new TextField(
                        decoration: new InputDecoration(hintText: "Enter address"),
                        controller: addressController,

                    ),
                    new FlatButton(
                      child: new Text("Place order"),
                      onPressed: ()async{
                       // CartMiniProduct cartMiniProduct=new CartMiniProduct();
                      Map map={
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

                      
                      Navigator.pop(context);
                      },
                    )
                  ],
    ),
  ),
);
          },)
                ;
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

else{
  print("\n\n\n\n\n\nHello\n\n\n\n\n");
return new MaterialApp(
home: new Scaffold(
appBar: new AppBar(
  title: new Text("Ooops"),
),
  body:new Column(
children: <Widget>[
 new ListTile(
  title:new Row(
    children: <Widget>[
    Icon(Icons.error),
  new Text("Seems Like We are not Logged in!\nTo add, update and maintain your cart, \nLogin below\n",)
    ],
 ),
 ),
  new MaterialButton(
    color: Colors.teal,
                  textColor: Colors.white,
                  child: new Text("Login"),
                  onPressed: (){
                    
                   Navigator.push(context, MaterialPageRoute(
                     builder: (context){
return Login();
                     }
                   ));
                  },
                  splashColor: Colors.redAccent,
  )
],

  )
),

);


}


}

}