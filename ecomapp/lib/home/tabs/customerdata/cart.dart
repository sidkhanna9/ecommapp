import 'package:flutter/material.dart';

class Cart extends StatelessWidget{

@override
Widget build(BuildContext context)
{
  return new Container(
    child: new Center(
        child: new Icon(Icons.add_shopping_cart, size: 150.0, color: Colors.brown)
      )
  );
}

}