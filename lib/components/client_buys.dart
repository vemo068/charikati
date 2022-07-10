import 'package:charikati/components/buy_tile.dart';
import 'package:charikati/controllers/buys_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientBuys extends StatelessWidget {
  ClientBuys({Key? key}) : super(key: key);
  final BuysController buysController = Get.find<BuysController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: buysController,
        builder: (_) {
          return ListView.builder(
              itemCount: buysController.buys.length,
              itemBuilder: (context, index) {
                return BuyTile(buy: buysController.buys[index]);
              });
        });
  }
}
