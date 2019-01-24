import 'package:ecomapp/product/model.dart';
import 'package:ecomapp/searchhandler/MiniProduct.dart';
import 'package:ecomapp/searchhandler/Orders.dart';
import 'package:flutter/material.dart';

class Customer{
  String emailId,password;
  String phoneNumber,firstName,lastName;


}

Customer session=new Customer();
String inventoryUrl=hostip+":10000/inventory/";
String hostip="http://10.177.7.88";
String loginURL=hostip+":8000/auth/signin";
String signUpURL=hostip+":8000/auth/signup";
String searchURL=hostip+":3000/search/all/";
String searchQuery;
String productFetchUrl=hostip+":4000/product/get/";
String productId;
String laptopURL=hostip+"/category/electronics.jpg",
accPhone=hostip+"/category/phone_accessories.jpg",
phoneURL=hostip+"/category/phone.jpg",
furnitureURL=hostip+"/category/furniture.jpg",
watchURL=hostip+"/category/watches",
clothURL=hostip+"/category/clothing.jpg",
shoeURL=hostip+"/category/shoes.jpg",
jewelry=hostip+"/category/jewellery.jpg";
String addToCartURL=hostip+":7000/cart/item/add/";
String merchantUrl=hostip+":5000/merchant/get?merchantId=";
String token;
String getCartURL=hostip+":7000/cart/get?token=";
Map<String,String> postHeader={
  "Content-Type":"application/json"
};
Map<String,String> getHeader={
  "Accept":"application/json"
};
BuildContext homeContext;
List<MiniProduct> mp=new List<MiniProduct>();
List<Orders> o=new List<Orders>();
Product product;
String categorySearchUrl=hostip+":4000/product/category/";
Product productGlobal;
String getAddress=hostip+":7000/address/get?token=";
String orderUrl=":13000/order/new";
String userDetail=":8000/auth/find?emailId=";
Map data;
int index;