import 'package:charikati/components/appbar.dart';
import 'package:charikati/components/clients_list.dart';
import 'package:charikati/components/drawer.dart';
import 'package:charikati/components/fab_ajoute.dart';
import 'package:charikati/components/normal_padding.dart';
import 'package:charikati/controllers/client_controller.dart';
import 'package:charikati/pages/add_client_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final ClientController clientController = Get.put(ClientController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FabAjoute(
        ontap: () {
          Get.to(() => AddClientPage());
        },
      ),
      appBar: charikatiAppBar("Home"),
      drawer: SettingDrawer(),
      body: NormalPadding(child: ClientsList()),
    );
  }
}
