import 'package:meta/meta.dart';

class Product {
  
  @required  List<String> inventoryId;
  @required  String productId;
  @required  double productRating;
  @required  String name;
  @required  String avatar;
@required    String description;
    @required String features;
   @required List<int> cost;
   @required List<double> merchantRating;
  @required  List<int> quantityLeftMerchant;
   @required List<String> imageURLList;
  @required  List<String> merchantId;
   @required List<String> merchantName;


    Product({
    this.inventoryId,
    this.productId,
    this.productRating,
    this.name,
    this.avatar,
    this.description,
    this.features,
    this.cost,
    this.merchantRating,
    this.quantityLeftMerchant,
    this.imageURLList,
    this.merchantId,
    this.merchantName,
  
    });
}
