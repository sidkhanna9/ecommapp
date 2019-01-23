
import 'dart:convert';

import 'package:ecomapp/home/home_page.dart';
import 'package:ecomapp/home/tabs/welcome.dart';
import 'package:ecomapp/themedata/Theme.dart' as theme;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:ecomapp/globals/global.dart' as gb;

class Place extends StatefulWidget{

@override
PlaceState createState() => new PlaceState();
}

class PlaceState extends State<Place>{


  final addressController=TextEditingController();
Map data;
String url=gb.getAddress+gb.session.emailId;


// Future<String> getData() async{
  
//   http.Response response= await http.get(
//     Uri.encodeFull(url),
//   headers:gb.getHeader
//   );

// print(url);
//   this.setState((){
// data = json.decode(response.body);
// print(data['addressList'].length);
//   });
//   return "SUCCESS";
// }
Future<String> getData() async {


Map map = {
    'inventoryId':"30d1af46-fb7f-41a4-8657-e3a6a73ccc43",
    'customerId':gb.session.emailId,
    'address':addressController.text,
    'quantity':1,
  };

http.Response response = await http.post(gb.hostip+":8080/order/new",
headers: gb.postHeader,
body: utf8.encode(json.encode(map))
);

var jsonData=json.decode(response.body);
//var status=jsonData['status'];
//print(jsonData['status']);
if(response.statusCode == 200)
{
  
  Fluttertoast.instance.showToast(
        msg: "SignUp Successful Login to continue"  ,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        backgroundColor: Colors.grey,
        textColor: Colors.white);
          //Navigator.of(mct).pop(true);
  

}

else
{
    

  Fluttertoast.instance.showToast(
        msg: "SignUp Failed"  +jsonData['message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        backgroundColor: Colors.grey,
        textColor: Colors.white);
       
        
       
}
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
                    getData;
                    // Navigator.push(context, MaterialPageRoute(builder: (context){
                    //     return Welcome();
                    // }));
                  },
                  splashColor: Colors.redAccent,
                ),
        
     ),
    )
  );
}
}