import 'dart:ffi';

import 'package:charikati/controllers/client_controller.dart';
import 'package:charikati/models/buy.dart';
import 'package:charikati/services/database_services.dart';
import 'package:get/get.dart';

class BuysController extends GetxController {
  final DatabaseService db = DatabaseService();
  final ClientController clientController = Get.find<ClientController>();
  List<Buy> buys = [];
  
  @override
  void onInit() {
    getClientBuys();
    super.onInit();
  }

  void getClientBuys() async {
    var b = await db.getClientBuys(clientController.selectedClient!.id!);
    if (b != null) {
      buys = b;
    } else {
      buys = [];
    }
      
   
    update();
  }
}
