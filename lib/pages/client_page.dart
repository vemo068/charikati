import 'package:charikati/components/appbar.dart';
import 'package:charikati/components/client_info_box.dart';
import 'package:charikati/controllers/client_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientPage extends StatelessWidget {
   ClientPage({ Key? key }) : super(key: key);
  final ClientController clientController=Get.find<ClientController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: charikatiAppBar("Client Info"),
      body: Column(
        children: [
          ClientInfoBox(),
          SizedBox(height: 20),
         
        ],
      ),

    );
  }
}