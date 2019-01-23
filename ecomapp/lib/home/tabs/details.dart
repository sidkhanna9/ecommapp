import 'package:ecomapp/home/tabs/customerdata/account.dart';
import 'package:ecomapp/home/tabs/customerdata/order.dart';
import 'package:flutter/material.dart';

import 'package:ecomapp/themedata/Theme.dart' as theme;
class Details extends StatefulWidget{

@override
DetailState createState() => new DetailState();
}

class DetailState extends State<Details>{
int _currentIndex = 0;
final List<Widget> _children = [
  new Account(),
  new Order(),
];
void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }
@override
Widget build(BuildContext context)
{
  return new MaterialApp(
    home: new Scaffold(
      backgroundColor: theme.Colors.productPageBackground,
    appBar: new AppBar(
      backgroundColor: theme.Colors.appBarTitle,
      title: new Text("Account Details")
    ),
    body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue,
       onTap: onTabTapped, // new
       currentIndex: _currentIndex, 
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.account_circle),
           title: new Text('Account'),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.account_box),
           title: new Text('Orders'),
         ),
         
       ],
     ),
  ));
}

}