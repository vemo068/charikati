
import 'dart:io';

import 'package:charikati/models/client.dart';
import 'package:charikati/models/order.dart';
import 'package:charikati/models/sell.dart';
import 'package:charikati/services/database_services.dart';
import 'package:charikati/services/pdf_services/pdf_api.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfInvoiceApi {
  static Future<File> generate(Sell sell) async {
    final DatabaseService db=DatabaseService();
    List<Order> orders = await db.getBuyOrders(sell.id!) ;
    Client client = await db.client(sell.clientId) ;
    final pdf = Document();

    pdf.addPage(MultiPage(
      build: (context) => [
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(sell.date),
          clientInfo(client)
        ]
       ),
        SizedBox(height: 3 * PdfPageFormat.cm),
        ordersList(orders),
        Divider(),
       
      ],
      //footer: (context) => buildFooter(invoice),
    ));

    return PdfApi.saveDocument(name: 'my_invoice.pdf', pdf: pdf);
  }
  static Widget clientInfo(Client client) {
    return Column(
      children: [
        Text(client.name),
        Text(client.email),
        Text(client.phone),
      ],
    );
  }
  static Widget ordersList(List<Order> orders) {
    return Column(
      children: [
        for (var order in orders)
          Text(order.total.toString()+" DA"),
        
      ],
    );
  }

}