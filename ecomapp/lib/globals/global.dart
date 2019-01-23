import 'package:ecomapp/product/model.dart';
import 'package:ecomapp/searchhandler/MiniProduct.dart';

class Customer{
  String emailId,password;


}

Customer session=new Customer();
String loginURL="http://10.177.7.88:8000/auth/signin";
String signUpURL="http://10.177.7.88:8000/auth/signup";
String searchURL="http://10.177.7.88:7000/search/all/";
String searchQuery;
String productFetchUrl;
String productId,laptopURL,accPhone,phoneURL,furnitureURL,watchURL,clothURL,shoeURL,jewelry;

Map<String,String> postHeader={
  
  "Content-Type":"application/json"

};
Map<String,String> getHeader={
  "Accept":"application/json"
};
MiniProduct tmp;
List<MiniProduct> mp=[];
Product product;
