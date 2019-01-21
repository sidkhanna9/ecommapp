import 'package:ecomapp/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(title: 'Category Demo',
  theme: ThemeData(
    primarySwatch: Colors.blue,
  ),
  home:HomePage(),
  );

  }
}