import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ecomapp/globals/global.dart' as gb;
import 'package:http/http.dart' as http;
import 'package:ecomapp/themedata/Theme.dart' as theme;
class Account extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => AccountState();


}


class AccountState extends State<Account>{


    

  @override
  Widget build(BuildContext context) {

List<IconData> ic=[Icons.email,Icons.person,Icons.call];
List<String> details=[gb.session.emailId,gb.session.firstName+" "+gb.session.lastName,gb.session.phoneNumber];
return new MaterialApp(
  home:new Scaffold(
    body: new Container(
child:ListView.builder(
              itemCount:3,
              itemBuilder:(BuildContext context,int index){
return new ListTile(
title: new Row(
  children: <Widget>[
    new Icon(ic[index]),
    new Text(details[index]),
  ],
    ),
  );
  
  }
  )
  )
  )
  );
       }
  }
