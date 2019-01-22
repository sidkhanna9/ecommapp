import 'dart:convert';

import 'package:ecomapp/model.dart';
import 'package:ecomapp/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:ecomapp/MiniProduct.dart';
import 'package:ecomapp/Theme.dart' as Theme;
import 'package:http/http.dart' as http;
//import 'package:fluro/fluro.dart';
class ProductRow extends StatelessWidget{
  MiniProduct mini;
    ProductRow({this.mini});
  

Product arg;

  Future<Product> _product() async{
print("Row fetched");
print("\n\n\n\n\n\n\n\n\n");

String url="http://10.177.7.88:5000/product/get/"+this.mini.productId;
print("\n\n\n"+this.mini.productId+"\n\n\n\n\n");
http.Response response = await http.get(Uri.encodeFull(url),
headers: {
  "Accept":"application/json"
});
print("yaha pe");
print(response.body);
print("\n\n\n\n\n\n\n\n\n");

var jsonData=json.decode(response.body);
this.arg= Product(name: jsonData['productName'],
 avatar: jsonData['imageSrc'][0],
  description: jsonData['description'],
   images: jsonData['imgSrc'],
    rating: jsonData['rating'], 
    features: jsonData['keyFeatures'],
     id: jsonData['productId'],);
return arg;

  }
 
  @override
  Widget build(BuildContext context) {
print("\n\n\n\n\n\n\n\n\n");
    print(mini.imageUrl);
    final productThumbnail=new Container(

alignment: new FractionalOffset(0.0, 0.5),
      margin: const EdgeInsets.only(left: 24.0),
      child: new Hero(
        tag: 'product-icon-${mini.productId}',
        child: ClipRRect( 
          borderRadius: new BorderRadius.circular(10.0),
          child:Image.network(
            
          mini.imageUrl,
          height: Theme.Dimens.productHeight,
          width: Theme.Dimens.productWidth,
        
        fit: BoxFit.fitHeight
        )
        ),
      ),
    );
  
  

final productCard = new Container(
      margin: const EdgeInsets.only(left: 72.0, right: 24.0),
      decoration: new BoxDecoration(
        color: Theme.Colors.productCard,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(color: Colors.black,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0))
        ],
      ),
      child: new Container(
        margin: const EdgeInsets.only(top: 16.0, left: 72.0),
        constraints: new BoxConstraints.expand(),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(mini.productName, style: Theme.TextStyles.productTitle),
            new Text(mini.category, style: Theme.TextStyles.productCategory),
            new Container(
              color: const Color(0xFF00C6FF),
              width: 24.0,
              height: 1.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0)
            ),
            new Row(
              children: <Widget>[
                new Icon(Icons.star, size: 14.0,
                  color: Theme.Colors.productRating),
                new Text(
                  mini.rating.toString(), style: Theme.TextStyles.productRating),
                new Container(width: 24.0),
                new Icon(Icons.monetization_on ,size: 14.0,
                  color: Theme.Colors.productBestPrice),
                new Text(
                  mini.bestPrice.toString(), style: Theme.TextStyles.productBestPrice),
              ],
            )
          ],
        ),
      ),
    );

    return new Container(
      height: 120.0,
      margin: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: new FlatButton(
       // onPressed: () => _navigateTo(context, mini.productId),
        onPressed: (){
print("\n\n\n\n\n\n\n\n\n");
    print(mini.imageUrl+"Nav ke upar wal");
          Navigator.push(context, MaterialPageRoute( builder:(context)  {
  

              _product();
  
              return ProductDetailPage( arg); 
              
              

          }
               )
              
          );
        },
        
        child: new Stack(
          children: <Widget>[
            productCard,
            productThumbnail,
          ],
        ),
      ),
    );
  }

  // _navigateTo(context, String id) {
  //   Routes.navigateTo(
  //     context,
  //     '/detail/${planet.id}',
  //     transition: TransitionType.fadeIn
  //   );
  // }

}