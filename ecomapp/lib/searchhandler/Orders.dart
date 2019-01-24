class Orders {

String productId,orderId,inventoryId,merchantId,customerId,modeOfPayment,address,status;
String date;
int price;
int orderRating;
int quantity;


 Orders(
   {
     this.price,
     this.productId,
     this.orderId,
     this.inventoryId,
     this.merchantId,
     this.customerId,
     this.modeOfPayment,
     this.address,
     this.status,
     this.date,
     this.orderRating,
     this.quantity
   });


}