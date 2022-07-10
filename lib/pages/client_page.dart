import 'package:charikati/components/appbar.dart';
import 'package:charikati/components/client_buys.dart';
import 'package:charikati/components/client_info_box.dart';
import 'package:charikati/controllers/buys_controller.dart';
import 'package:charikati/controllers/client_controller.dart';
import 'package:charikati/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientPage extends StatelessWidget {
  ClientPage({Key? key}) : super(key: key);
  final ClientController clientController = Get.find<ClientController>();
  final BuysController buysController = Get.put(BuysController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: charikatiAppBar("Client Info"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClientInfoBox(),
          SizedBox(height: 20),
          Text("Buys History",style: mediHeadlineStyle,),
          SizedBox(height: 10),
          Expanded(child: ClientBuys()),
        ],
      ),
    );
  }
}
