import 'package:ecomapp/searchhandler/MiniProduct.dart';

class Customer{
  String email,password;
Customer({this.email,this.password});

}

Customer session;
String loginURL="http://10.177.7.88:8080/auth/login";
String signUpURL="";
String searchURL="http://10.177.7.88:7000/search/all/";

Map<String,String> postHeader={
  
  "Content-Type":"application/json"

};
Map<String,String> getHeader={
  "Accept":"application/json"
};
MiniProduct tmp;
List<MiniProduct> mp=[];