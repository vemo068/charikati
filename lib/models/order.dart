class Order {
  int? id;
  int contity;
  int productId;
  int buyId;
  Order({this.id, required this.contity, required this.productId, required this.buyId});

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'contity': contity,
      'productId': productId,
      'buyId': buyId,
    };
  }
   factory Order.fromMap(Map<String, dynamic> map){
    return Order(
      id: map['id']?.toInt() ?? 0,
      contity: map['contity'] ,
      productId: map['productId'] ,
      buyId: map['buyId'] ,
    );}
}
