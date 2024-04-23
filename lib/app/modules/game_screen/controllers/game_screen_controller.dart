import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameScreenController extends GetxController {
  //TODO: Implement GameScreenController

  var rowCount = int.parse(Get.arguments[0]);
  var columnCount = int.parse(Get.arguments[1]);

  List<List<TextEditingController>> textFieldController = [];

  @override
  void onInit() {
    // TODO: implement onInit

    // Initialize controllers
    for (int i = 0; i < rowCount; i++) {
      List<TextEditingController> rowControllers = [];
      for (int j = 0; j < columnCount; j++) {
        rowControllers.add(TextEditingController());
      }
      textFieldController.add(rowControllers);
    }
  }
}
