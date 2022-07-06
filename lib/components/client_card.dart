import 'package:charikati/controllers/client_controller.dart';
import 'package:charikati/models/client.dart';
import 'package:charikati/pages/client_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientCard extends StatelessWidget {
  final Client client;
  ClientCard({Key? key, required this.client}) : super(key: key);
  final ClientController clientController = Get.find<ClientController>();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        clientController.selectedClient = client;
        Get.to(()=>ClientPage());
      },
      leading: Icon(Icons.person),
      title: Text(client.name),
      subtitle: Text(client.phone),
      trailing: Text(client.email),
    );
  }
}
