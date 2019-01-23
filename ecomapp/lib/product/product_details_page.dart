import 'dart:convert';
import 'dart:ui' as ui;
import 'package:ecomapp/Login/login.dart';
import 'package:ecomapp/home/tabs/customerdata/cart.dart';
import 'package:ecomapp/product/model.dart';
import 'package:ecomapp/themedata/image_card.dart';
import 'package:flutter/material.dart';
import 'package:ecomapp/globals/global.dart' as gb;
import 'package:ecomapp/themedata/Theme.dart' as Theme;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;




 class ProductDetailPage extends StatefulWidget{
   @override
   ProductState createState() => new ProductState();
 }

 class ProductState extends State<ProductDetailPage>{

var myInt,qInt;
  final quantityController=TextEditingController();
   final Product product=gb.product;
  var itemSelect;
  List<String> costA;
  Widget _buildContent(){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildAvatar(),
          _buildInfo(),
          _buildImageScroller(),
        ],
      ),
    );
  }

  Widget _buildAvatar(){
    return Container(
      width: 110.0,
      height: 110.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white30),
      ),
      margin: const EdgeInsets.only(top: 32.0,left: 16.0),
      padding: const EdgeInsets.all(3.0),
      child: ClipOval(
        child: Image.asset(gb.product.avatar),
      ),
    );
  }

  Widget _buildInfo(){
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right:16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            gb.product.name,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
          new Row(
              children: <Widget>[
          new Icon(Icons.star, size: 14.0,
                  color: Colors.black),
                  new Text(
                  gb.product.productRating,
            style:TextStyle(
              color:Colors.black.withOpacity(0.85),
              fontWeight: FontWeight.w500,
            ),
            ),
              ]
          ),
          Container(
            color: Colors.black.withOpacity(0.85),
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            width: 225.0,
            height: 1.0,
          ),

          DropdownButton<String>(
            hint: new Text("Select Merchant"),
            isExpanded: true,
            items: new List<DropdownMenuItem<String>>.generate(
          gb.product.merchantName.length,
          (int index) => new DropdownMenuItem<String>(
                value: gb.product.merchantName[index]+"("+gb.product.cost[index].toString()+"\tRating:"
                +gb.product.merchantrating[index].toString()+
                ")\nQuantity:"+gb.product.quantityLeftMerchant[index].toString(),
                child: new Text(index.toString()),
              ),
        
        
        ),
        onChanged: (String  value) {
          this.itemSelect=value;
          costA=value.split(':');
        },
        value:itemSelect,
        ),
        new TextFormField(
          controller: quantityController,
                    decoration: new InputDecoration(
                      labelText : "Enter quantity out of "+costA[2]
                    ),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                ),
          Text(
            "Description:\n"+gb.product.description+"Features:\n"+gb.product.features,
            style: TextStyle(
              color: Colors.black.withOpacity(0.85),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageScroller(){
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: SizedBox.fromSize(
        size: Size.fromHeight(245.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          itemCount: gb.product.imageURLList.length,
          itemBuilder: (BuildContext context,int index){
            var image=gb.product.imageURLList[index];
            return ImageCard(image);
          },
        ),
      ),
    );
  }
Future<String> getData() async {
  if(costA!=null)
{
  myInt = int.parse(costA[2]);
assert(myInt is int);
qInt = int.parse(quantityController.text);
assert(qInt is int);
}
if(costA==null){
  Fluttertoast.showToast(
        msg: "Select a merchant",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        backgroundColor: Colors.grey,
        textColor: Colors.white
    );
  return null;
}
else if(qInt>myInt){
  Fluttertoast.showToast(
        msg: "Maximum quantity "+myInt,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        backgroundColor: Colors.grey,
        textColor: Colors.white
    );
    return null;
}
else{
 
Map map={"token" : gb.token,
  "product" : {
    "inventoryId": gb.product.inventoryId,
    "productId": gb.product.productId,
    "productName": gb.product.name,
    "imageSrc": gb.product.avatar,
    "productRating": gb.product.productRating,
    "quantity": gb.product.quantityLeftMerchant,
    "price": gb.product.cost,
  }
};


http.Response response = await http.post(gb.addToCartURL+gb.token,
headers: {
  "Content-Type":"application/json"
},
body: utf8.encode(json.encode(map)),

);

var jsonData=json.decode(response.body);

if(jsonData['status']=="SUCCESS")
{
  Fluttertoast.showToast(
        msg: "Successfully added",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        backgroundColor: Colors.grey,
        textColor: Colors.white
    );
    

}
else{
  Fluttertoast.showToast(
        msg: "Login Failed"  +jsonData['message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        backgroundColor: Colors.grey,
        textColor: Colors.white);


} 
  }}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    resizeToAvoidBottomPadding: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          //Image.asset("assets/2.jpg",fit: BoxFit.cover),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.white,
              child: _buildContent(),
          )
      ),
        ],
        
      ),
      bottomNavigationBar: BottomAppBar(
        //hasNotch: false,
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new RaisedButton(
                  color: Colors.teal,
                  textColor: Colors.white,
                  child: new Text("Add to cart"),
                  onPressed: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context){
                    //     return Signup();
                    // }));
                  },
                  splashColor: Colors.redAccent,
                ),
          new RaisedButton(
                  color: Colors.teal,
                  textColor: Colors.white,
                  child: new Text("Add to wishlist"),
                  onPressed: (){
                  },
                  splashColor: Colors.redAccent,
                )
        ],
      ),
     ),
    );
  }
}