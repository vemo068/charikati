class Order {
  int? id;
  int contity;
  int total;
  int productId;
  int buyId;
  Order(
      {this.id,
      required this.total,
      required this.contity,
      required this.productId,
      required this.buyId});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'total': total,
      'contity': contity,
      'productId': productId,
      'buyId': buyId,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      
      id: map['id']?.toInt() ?? 0,
      contity: map['contity'],
      productId: map['productId'],
      buyId: map['buyId'],
      total: map['total'],
    );
  }
}
