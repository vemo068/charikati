import 'package:charikati/controllers/designation_controller.dart';
import 'package:charikati/models/designation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseDesignation extends StatelessWidget {
  ChooseDesignation({Key? key}) : super(key: key);
  DesignationController designationController =
      Get.find<DesignationController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: designationController,
        builder: (_) {
          return DropdownButtonHideUnderline(
              child: DropdownButton<Designation?>(
            value: designationController.selectedDesignation,
            icon: Icon(Icons.settings),
            hint: Text("Select Designation"),
            items: designationController.designations.map((Designation des) {
              return DropdownMenuItem<Designation?>(
                value: des,
                child: Text(des.name),
              );
            }).toList(),
            onChanged: (Designation? value) {
              designationController.selectedDesignation = value;
              designationController.update();
            },
          ));
        });
  }
}
