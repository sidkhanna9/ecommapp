import 'package:flutter/material.dart';

class Account extends StatelessWidget{

@override
Widget build(BuildContext context)
{
  return new Scaffold(
    appBar: new AppBar(
      title: new Text("Account")
    ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue,
       currentIndex: 0, // this will be set when a new tab is tapped
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.dvr),
           title: new Text('Your Orders'),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.arrow_right),
           title: new Text('Sign out'),
         ),
         
       ],
     ),
  );
}

}