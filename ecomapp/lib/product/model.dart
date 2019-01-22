import 'package:meta/meta.dart';

class Product {
  
    List<String> inventoryId;
    String productId;
    String productRating;
    String name;
    String avatar;
    String description;
    String features;
    List<int> cost;
    List<int> merchantrating;
    List<int> quantityLeftMerchant;
    List<String> imageURLList;
    List<String> merchantId;
    List<String> merchantName;


    Product({
    this.inventoryId,
    this.productId,
    this.productRating,
    this.name,
    this.avatar,
    this.description,
    this.features,
    this.cost,
    this.merchantrating,
    this.quantityLeftMerchant,
    this.imageURLList,
    this.merchantId,
    this.merchantName,
  
    });
}
