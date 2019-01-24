
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:ecomapp/globals/global.dart' as gb;
import 'package:ecomapp/searchhandler/CartMiniProduct.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ecomapp/themedata/Theme.dart' as theme;

class Merchant extends StatefulWidget{

@override
MerchantState createState() => new MerchantState();
}


 List<Entry> data=[];

BuildContext mct;

class MerchantState extends State<Merchant>{


// @override
// Future initState()  => this.getData();
@override
Widget build(BuildContext context)
{


  for(int i=0;i<gb.productGlobal.merchantName.length;i++)
  {
    data.add(Entry(
      gb.productGlobal.merchantName[i],<Entry>[Entry(gb.productGlobal.merchantName[i]+" has a Rating of "+gb.productGlobal.merchantRating[i].toString()+"\nStock "+gb.productGlobal.quantityLeftMerchant.toString()+"\nPrice Per Unit "+gb.productGlobal.cost[i].toString())]
    ));
  }
  return new MaterialApp(
    home: new Scaffold(

      backgroundColor: theme.Colors.productPageBackground,
    appBar: new AppBar(
      backgroundColor: theme.Colors.themeColor,
      title: new Text("Wishlist"),
    ),

    body: new ListView.builder(
      itemCount: gb.productGlobal.merchantName == null ? 0 : gb.productGlobal.merchantName.length,
       itemBuilder: (BuildContext context,int index)=>EntryItem(entry: data[index]),
      
    ),
    )
  );
}
}

class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}
class EntryItem extends StatelessWidget {
   EntryItem({this.entry});

  final Entry entry;
TextEditingController _c=new TextEditingController();
  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title),
    onTap: (){
      int i=0;
      
      for(var v in gb.productGlobal.merchantName){
          if(v==root.title.split(" has a Rating")[0]){
            print(i);
break;
          }
          i++;
      }
        showDialog(
         // context:context,
         context:mct,
          builder: (BuildContext context){
return AlertDialog(

  content: SingleChildScrollView(
    child: ListBody(
      children: <Widget>[
                    new TextField(
                        decoration: new InputDecoration(hintText: "Cart Quantity to Add:(Available)" + gb.productGlobal.quantityLeftMerchant[i].toString() ),
                        controller: _c,

                    ),
                    new FlatButton(
                      child: new Text("Add To Cart"),
                      onPressed: ()async{
                       // CartMiniProduct cartMiniProduct=new CartMiniProduct();
                      Map map={
                          'token':gb.session.emailId,
                          'product':{
                           'price': gb.productGlobal.cost[i],
                           'productId': gb.productGlobal.productId,
                           'productName': gb.productGlobal.name,
                           'productRating':gb.productGlobal.productRating ,
                           'imageSrc': gb.productGlobal.avatar,
                           'inventoryId': gb.productGlobal.inventoryId[i],
                           'quantity':int.parse( _c.text,) 
                          }};
                          http.Response response = await http.post(gb.addToCartURL,
headers: gb.postHeader,
body: utf8.encode(json.encode(map))
);

           
var jsonData=json.decode(response.body);
var status=response.statusCode;
print(jsonData['status']);
if(status == 200)
{
  
  Fluttertoast.instance.showToast(
        msg: "inserted"  ,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        backgroundColor: Colors.grey,
        textColor: Colors.white);
    //      Navigator.of(mct).pop(true);
  

}           
                      
                      
                      Navigator.pop(context);
                      },
                    )
                  ],
    ),
  ),
);
          },);
          // child: new Dialog(
          //       child: new Column(
          //         children: <Widget>[
          //           new TextField(
          //               decoration: new InputDecoration(hintText: "Cart Quantity to Add:(Available)" + gb.productGlobal.quantityLeftMerchant[i].toString() ),
          //               controller: _c,

          //           ),
          //           new FlatButton(
          //             child: new Text("Save"),
          //             onPressed: (){
                        
          //             Navigator.pop(mct);
          //             },
          //           )
          //         ],
          //       ),

          //     ), context: mct);


    },
    
    );
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mct=context;
    return _buildTiles(entry);
  }
}
