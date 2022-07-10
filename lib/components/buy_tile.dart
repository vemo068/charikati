import 'package:charikati/models/buy.dart';
import 'package:charikati/pages/buy_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuyTile extends StatelessWidget {
  final Buy buy;
  const BuyTile({Key? key,required this.buy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (() {
        Get.to(() => BuyPage());
      }),
      
      tileColor: Colors.red.withOpacity(0.2),
      leading: Icon(Icons.shopping_cart),
      title: Text("${buy.date}"),
      subtitle: Text(buy.total.toString()),
    );
    
  }
}
