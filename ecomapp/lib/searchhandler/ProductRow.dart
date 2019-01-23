import 'dart:convert';
import 'package:ecomapp/globals/global.dart' as gb;
import 'package:ecomapp/product/model.dart';
import 'package:ecomapp/searchhandler/MiniProduct.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ecomapp/themedata/Theme.dart' as theme;
import 'package:ecomapp/product/product_details_page.dart';


class ProductRow extends StatelessWidget{
  MiniProduct mini;
    ProductRow({this.mini});
  Product product;
 
  @override
  Widget build(BuildContext context) {
  print("init"+mini.imageUrl);
    final productThumbnail=new Container(

alignment: new FractionalOffset(0.0, 0.5),
      margin: const EdgeInsets.only(left: 24.0),
      child: new Hero(
        tag: 'product-icon-${mini.productId}',
        child: ClipRRect( 
          borderRadius: new BorderRadius.circular(10.0),
          child:Image.network(
            
          mini.imageUrl,
          height: theme.Dimens.productHeight,
          width: theme.Dimens.productWidth,
        
        fit: BoxFit.fitHeight
        )
        ),
      ),
    );
  
  

final productCard = new Container(
      margin: const EdgeInsets.only(left: 72.0, right: 24.0),
      decoration: new BoxDecoration(
        color: theme.Colors.productCard,
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
            new Text(mini.productName, style: theme.TextStyles.productTitle),
            new Text(mini.category, style: theme.TextStyles.productCategory),
            new Container(
              color: const Color(0xFF00C6FF),
              width: 24.0,
              height: 1.0,
              margin: const EdgeInsets.symmetric(vertical: 8.0)
            ),
            new Row(
              children: <Widget>[
                new Icon(Icons.star, size: 14.0,
                  color: theme.Colors.productRating),
                new Text(
                  mini.rating.toString(), style: theme.TextStyles.productRating),
                new Container(width: 24.0),
                new Icon(Icons.monetization_on ,size: 14.0,
                  color: theme.Colors.productBestPrice),
                new Text(
                  mini.bestPrice.toString(), style: theme.TextStyles.productBestPrice),
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
       onPressed: (){
         
        gb.productId= mini.productId;
        getdata().then((onValue){
          print(product.avatar+"hello");
 Navigator.push(context, MaterialPageRoute(builder: (context){
   print("Hello hi ssup");
            return ProductDetailPage(product: product,);
 }
 )
 );
        }
        );}
,      
        child: new Stack(
          children: <Widget>[
            productCard,
            productThumbnail,
          ],
        ),
      ),
    );
  }



Future<String> getdata() async{
print("\n\n\n\n");
http.Response response= await http.get(Uri.encodeFull(gb.inventoryUrl+mini.productId),headers: gb.getHeader);
var jsonData=json.decode(response.body);
print(jsonData);
print("\n\n\n\n");
http.Response response2= await http.get(Uri.encodeFull(gb.productFetchUrl+mini.productId),headers: gb.getHeader);
var jsonData2=json.decode(response2.body);
List<String> merchantId=new List<String>();
List<String> merchantName=new List<String>();
List<int> price=new List<int>();
List<int> quantityLeft=new List<int>();
List<String> inventoryId=new List<String>();
List<double> merchantRating=new List<double>();
List<String> imageURL=new List<String>();
for (var v in jsonData){

  merchantId.add(v['merchantId']);
  merchantName.add(v['merchantName']);
  inventoryId.add(v['inventoryId']);
  quantityLeft.add(v['quantityLeft']);
  price.add(v['price']);
http.Response response3= await http.get(Uri.encodeFull(gb.merchantUrl+merchantId.last),headers: gb.getHeader);
var jsonData3=json.decode(response3.body);
print(response3.body);
merchantRating.add(jsonData3['merchantRating']);
}

for(var v in jsonData2['imageSrc']){
 imageURL.add(v);
}
 print("Ghar pohoch ke call kar dia");
//  "inventoryId": "30d1af46-fb7f-41a4-8657-e3a6a73ccc43",
//         "quantityLeft": 15,
//         "quantitySold": 0,
//         "price": 60000,
//         "productId": "a04be894-c950-4184-bba7-810bc2ce0070",
//         "merchantId": "52e94825-e8c8-4cb4-ae6b-e3e81df342c2",
//         "merchantName": "Sai Kiran",
//         "inventoryRating": 2.5;


    product=new Product(
    productId: jsonData2['productId'] ,
    productRating: jsonData2['productRating'],
    merchantId: merchantId,
    merchantName: merchantName,
    merchantRating: merchantRating,
    inventoryId: inventoryId,
    name: jsonData2['productName'],
    avatar: imageURL[0],
    description: jsonData2['description'],
    features: jsonData2['keyFeatures'],
    cost: price,
    quantityLeftMerchant: quantityLeft,
    imageURLList: imageURL
  );


// gb.product.productId=jsonData[''];
// gb.product.productRating=jsonData[''];
// gb.product.name=jsonData[''];
// gb.product.avatar=jsonData[''];
// gb.product.description=jsonData[''];
// gb.product.features=jsonData[''];
// gb.product.cost=jsonData[''];
// gb.product.merchantId=jsonData[''];
// gb.product.quantityLeftMerchant=jsonData[''];
// gb.product.imageURLList=jsonData[''];
// gb.product.merchantrating=jsonData[''];
// gb.product.merchantName=jsonData[''];





}
}

//   Future<Product> _product() async{

// String url="http://10.177.7.88:5000/product/get/"+this.mini.productId;
// http.Response response = await http.get(Uri.encodeFull(url),
// headers: {
//   "Accept":"application/json"
// });

// var jsonData=json.decode(response.body);
// this.arg= Product(name: jsonData['productName'],
//  avatar: jsonData['imageSrc'][0],
//   description: jsonData['description'],
//    images: jsonData['imgSrc'],
//     rating: jsonData['rating'], 
//     features: jsonData['keyFeatures'],
//      id: jsonData['productId'],);
// return arg;

//   }
