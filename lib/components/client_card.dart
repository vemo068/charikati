import 'package:charikati/models/client.dart';
import 'package:flutter/material.dart';

class ClientCard extends StatelessWidget {
  final Client client;
  const ClientCard({ Key? key,required this.client }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        
      },
      leading: Icon(Icons.person),
      title: Text(client.name),
      subtitle: Text(client.phone),
      trailing: Text(client.email),
    
      
    );
  }
}