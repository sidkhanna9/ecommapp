
import 'package:flutter/material.dart';
import 'package:ecomapp/home/tabs/customerdata/cart.dart' as cart;
import 'package:ecomapp/home/tabs/customerdata/wishlist.dart' as wishlist;
import 'package:ecomapp/offlinedata/contact.dart' as contact;
import 'package:ecomapp/home/tabs/welcome.dart' as welcome;
import 'package:ecomapp/home/tabs/details.dart' as details;
class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>HomeTabs();

}
class HomeTabs extends State<HomePage> with SingleTickerProviderStateMixin{
  TabController tc;
  
  
@override
void initState(){
  super.initState();
  tc=new TabController(vsync: this,length: 5,initialIndex: 2);

}

@override
void dispose(){
  tc.dispose();
  super.dispose();

}


  @override
  Widget build(BuildContext context) {
    
    return new MaterialApp(
home:new Scaffold(
      bottomNavigationBar:  new Container(
        color: Colors.teal,
        child: new TabBar(
          controller: tc,
           tabs: <Tab>[
            
            
            new Tab(icon: Icon(Icons.favorite)),
            new Tab(icon: Icon(Icons.shopping_cart)),
            new Tab(icon: Icon(Icons.category)),
            new Tab(icon: Icon(Icons.account_circle)),
            new Tab(icon: Icon(Icons.help)),
          ]
          )
      ),
      body: new TabBarView(
        controller: tc,
        children: <Widget>[
          new wishlist.Wishlist(),
          new cart.Cart(),          
          new welcome.Welcome(),
          new details.Details(),
          new contact.Contact(),
        ]
      )
       )   );
    
    
  }


}