import 'package:charikati/controllers/sell_controller.dart';
import 'package:charikati/models/order.dart';
import 'package:charikati/models/product.dart';
import 'package:charikati/services/database_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final DatabaseService db = DatabaseService();
  final SellController sellController = Get.find<SellController>();
  List<Order> orders = [];
  Order? selectedOrder;

  Product? selectedProduct;
  int count = 1;
  TextEditingController quantityController = TextEditingController(text: "0");

  @override
  void onInit() {
    getSellOrders();
    super.onInit();
  }

  void getSellOrders() async {
    var or = await db.getBuyOrders(sellController.selectedSell!.id!);
    if (or != null) {
      orders = or;
    } else {
      orders = [];
    }
    update();
  }

  void saveOrder() async {
    int total = selectedProduct!.price * int.parse(quantityController.text);
    Order order = Order(
        total: total,
        contity: int.parse(quantityController.text),
        productId: selectedProduct!.id!,
        sellId: sellController.selectedSell!.id!);

    await db.insertOrder(order);
    getSellOrders();
    update();
  }

  void increaseCount() {
    count++;
    quantityController.text = count.toString();
    update();
  }

  void decreaseCount() {
    count--;
    quantityController.text = count.toString();
    update();
  }
}
