import 'package:charikati/components/appbar.dart';
import 'package:charikati/components/normal_padding.dart';
import 'package:charikati/controllers/sell_controller.dart';
import 'package:charikati/controllers/client_controller.dart';
import 'package:charikati/styles/colors.dart';
import 'package:charikati/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellPage extends StatelessWidget {
  SellPage({Key? key}) : super(key: key);
  final ClientController clientController = Get.find<ClientController>();
  final SellController sellController = Get.find<SellController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: charikatiAppBar("Buy info"),
      body: Column(
        children: [
          Container(
            color: kcmain,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      clientController.selectedClient!.name,
                      style: mediHeading3Style.copyWith(color: kcwhite),
                    )),
                    Expanded(
                      child: Text(sellController.selectedSell!.date.toString(),
                          style: mediHeading3Style.copyWith(color: kcwhite)),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text("${sellController.selectedSell!.total} DA",
                    style: mediHeading2Style.copyWith(color: kcaccent)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
