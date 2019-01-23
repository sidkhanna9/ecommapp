import 'package:flutter/material.dart';

import 'package:ecomapp/themedata/Theme.dart' as theme;
class Account extends StatelessWidget{

@override
Widget build(BuildContext context)
{
  return new MaterialApp(
    home: new Scaffold(
      backgroundColor: theme.Colors.productPageBackground,
  ));
}

}