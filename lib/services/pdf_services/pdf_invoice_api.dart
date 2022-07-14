import 'dart:io';

import 'package:charikati/components/logo.dart';
import 'package:charikati/models/client.dart';
import 'package:charikati/models/order.dart';
import 'package:charikati/models/sell.dart';
import 'package:charikati/services/database_services.dart';
import 'package:charikati/services/pdf_services/pdf_api.dart';
import 'package:charikati/styles/colors.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfInvoiceApi {
  static Future<File> generate(Sell sell) async {
    final DatabaseService db = DatabaseService();
    List<Order> orders = await db.getBuyOrders(sell.id!);
    Client client = await db.client(sell.clientId);
    final pdf = Document();

    pdf.addPage(MultiPage(
      build: (context) => [
        header(),
        Divider(),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(sell.date), clientInfo(client)]),
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
      crossAxisAlignment: CrossAxisAlignment.start,
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
        for (var order in orders) Text(order.total.toString() + " DA"),
      ],
    );
  }

  static Widget header() {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("R.C.  N°: 39/00-21B0544700"),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("NIF: 002139054470024", style: pdfStyle),
          Text("غمرة الوسطى – قمار – الوادي", style: pdfStyle),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Tel : 05.42.28.98.05", style: pdfStyle),
          Text("استيراد التجهيزات والمعدات المرتبطة بصناعة المعادن",
              style: pdfStyle),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Email : maaden.sahra@gmail.com", style: pdfStyle),
          Text("رأسمال: 15,000,000.00 دج", style: pdfStyle),
        ]),
      ])
    ]);
  }
}

TextStyle pdfStyle =
    TextStyle(color: PdfColors.blue, fontBold: Font.courierBold());
