import 'dart:ui' as ui;
import 'package:ecomapp/product/model.dart';
import 'package:ecomapp/themedata/image_card.dart';
import 'package:flutter/material.dart';
import 'package:ecomapp/globals/global.dart' as gb;
import 'package:ecomapp/themedata/Theme.dart' as Theme;

class ProductDetailPage extends StatelessWidget{

   Product product=gb.product;
  var itemSelect;
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

Widget _createDropDown(){
return DropdownButton<int>(
            hint: new Text("Select Quantity"),

            items: new List<DropdownMenuItem<int>>.generate(
          gb.product.merchantName.length,
          (int index) => new DropdownMenuItem<int>(
                value: index,
                child: new Text(index.toString()),
              ),
        ),
        onChanged: (int value) {
          this.itemSelect=value;
        },
        value:itemSelect,
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

            items: new List<DropdownMenuItem<String>>.generate(
          gb.product.merchantName.length,
          (int index) => new DropdownMenuItem<String>(
                value: gb.product.merchantName[index]+"("+gb.product.cost[index].toString()+
                ")\nQuantity:"+gb.product.quantityLeftMerchant[index].toString()+"\tRating:"+gb.product.merchantrating[index].toString(),
                child: new Text(index.toString()),
              ),
        ),
        onChanged: (String value) {
          this.itemSelect=value;
          _createDropDown();
        },
        value:itemSelect,
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
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue,
       currentIndex: 0, // this will be set when a new tab is tapped
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.shopping_cart),
           title: new Text('Add to cart'),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.favorite),
           title: new Text('Add to wishlist'),
         ),
         
       ],
     ),
    );
  }
}