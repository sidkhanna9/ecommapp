import 'package:ecomapp/Login/login.dart';
import 'package:ecomapp/home/tabs/customerdata/account.dart';
import 'package:ecomapp/home/tabs/customerdata/order.dart';
import 'package:flutter/material.dart';
import 'package:ecomapp/globals/global.dart';
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
  if(session.emailId!=null){
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
else{
  print("\n\n\n\n\n\nHello\n\n\n\n\n");
return new MaterialApp(
home: new Scaffold(
appBar: new AppBar(
  title: new Text("Ooops"),
),
  body:new Column(
children: <Widget>[
 new ListTile(
  title:new Row(
    children: <Widget>[
    Icon(Icons.error),
  new Text("Seems Like We are not Logged in!\nTo check your Account Details, \nLogin below\n",)
    ],
 ),
 ),
  new MaterialButton(
    color: Colors.teal,
                  textColor: Colors.white,
                  child: new Text("Login"),
                  onPressed: (){
                    
                   Navigator.push(context, MaterialPageRoute(
                     builder: (context){
return Login();
                     }
                   ));
                  },
                  splashColor: Colors.redAccent,
  )
],

  )
),

);


}

}


}