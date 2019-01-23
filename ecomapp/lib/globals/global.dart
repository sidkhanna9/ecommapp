import 'package:ecomapp/product/model.dart';
import 'package:ecomapp/searchhandler/MiniProduct.dart';

class Customer{
  String emailId,password;


}

Customer session=new Customer();
String hostip="http://10.177.7.88";
String loginURL=hostip+":8000/auth/signin";
String signUpURL=hostip+":8000/auth/signup";
String searchURL=hostip+":3000/search/all/";
String searchQuery;
String productFetchUrl;
String productId;
String laptopURL=hostip+"/categories",accPhone=hostip+"/categories",phoneURL=hostip+"/categories",furnitureURL=hostip+"/categories",watchURL=hostip+"/categories",clothURL=hostip+"/categories",shoeURL=hostip+"/categories",jewelry=hostip+"/categories";
String addToCartURL="http://10.177.7.88:7000/cart/item/add/";

String token;


Map<String,String> postHeader={
  
  "Content-Type":"application/json"

};
Map<String,String> getHeader={
  "Accept":"application/json"
};

List<MiniProduct> mp=new List<MiniProduct>();
Product product;
