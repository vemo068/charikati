import 'package:charikati/components/appbar.dart';
import 'package:charikati/components/fab_ajoute.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: charikatiAppBar("Produits"),
      floatingActionButton: FabAjoute(ontap: () {}),
    );
  }
}
