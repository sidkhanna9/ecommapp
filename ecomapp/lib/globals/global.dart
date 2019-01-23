import 'package:ecomapp/product/model.dart';
import 'package:ecomapp/searchhandler/MiniProduct.dart';

class Customer{
  String emailId,password;


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
String laptopURL=hostip+"/categories",accPhone=hostip+"/categories",phoneURL=hostip+"/categories",furnitureURL=hostip+"/categories",watchURL=hostip+"/categories",clothURL=hostip+"/categories",shoeURL=hostip+"/categories",jewelry=hostip+"/categories";
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

List<MiniProduct> mp=new List<MiniProduct>();
Product product;
