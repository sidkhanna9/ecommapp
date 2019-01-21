import 'package:flutter/material.dart';
import 'package:ecomapp/model.dart';
import 'package:ecomapp/image_card.dart';
import 'dart:ui' as ui;

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
          Text(
            product.rating,
            style:TextStyle(
              color:Colors.black.withOpacity(0.85),
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.85),
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            width: 225.0,
            height: 1.0,
          ),
          Text(
            product.description,
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

  Widget _buildButton(){
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/2.jpg"),
            fit: BoxFit.fitHeight,
          ),

    new MaterialButton(
                  color: Colors.black,
                  textColor: Colors.white,
                  child: new Text("Add to Cart"),
                  //onPressed: getData,
                  splashColor: Colors.redAccent,
                ),
    new MaterialButton(
                  color: Colors.black,
                  textColor: Colors.white,
                  child: new Text("Add to Wishlist"),
                  //onPressed: getData,
                  splashColor: Colors.redAccent,
                ),
           // color: Colors.black87,
            //colorBlendMode: BlendMode.lighten,
            _buildContent()
        ],
      ),
    );
  }
}