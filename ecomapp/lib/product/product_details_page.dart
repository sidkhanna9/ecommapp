import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:ecomapp/model.dart';
import 'package:ecomapp/image_card.dart'; 
import 'package:ecomapp/themedata/Theme.dart' as Theme;

class ProductDetailPage extends StatelessWidget{

  ProductDetailPage(this.product);
  final Product product;
  
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
        child: Image.asset(product.avatar),
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
            product.name,
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
                  product.rating,
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
          ),DropdownButton<String>(
            hint: new Text("Select Merchant"),
            
  items: <String>['A', 'B', 'C', 'D'].map((String value) {
    return new DropdownMenuItem<String>(
      value: value,
      child: new Text(value,
      style: TextStyle(
              color: Colors.black.withOpacity(0.85),
              height: 1.4,
            ),
      ),
    );
  }).toList(),
  onChanged: (_) {},
),
          Text(
            "Description:\n"+product.description+"Features:\n"+product.features,
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
          itemCount: product.images.length,
          itemBuilder: (BuildContext context,int index){
            var image=product.images[index];
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