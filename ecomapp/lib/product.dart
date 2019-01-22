import 'package:ecomapp/model.dart';
import 'package:ecomapp/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class Products extends StatelessWidget{
static final Product product=Product(
  name:"abc",
  avatar:"assets/cool-htc-one-wallpapers-4310228.png",
  description:"xyz" ,
  rating:"3",
  images: <Images>[
    Images(
      title:"xyz",
    thumbnail: "assets/cool-htc-one-wallpapers-4310228.png",
    ),
    Images(
      title:"xyz",
    thumbnail: "assets/cool-htc-one-wallpapers-4310228.png",
    ),Images(
      title:"xyz",
    thumbnail: "assets/cool-htc-one-wallpapers-4310228.png",
    ),Images(
      title:"xyz",
    thumbnail: "assets/cool-htc-one-wallpapers-4310228.png",
    ),
  ],
);

@override
Widget build(BuildContext context){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

  return MaterialApp(title: 'Product Demo',
  theme: ThemeData(
    primarySwatch: Colors.blue,
  ),
  home:ProductDetailPage(product),
  );
}
}