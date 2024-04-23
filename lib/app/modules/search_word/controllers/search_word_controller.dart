import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchWordController extends GetxController {
  List<List<TextEditingController>> textFieldController = Get.arguments[0];
  var rowCount = int.parse(Get.arguments[1].toString()).obs;
  var columnCount = int.parse(Get.arguments[2].toString()).obs;

  var wordToSearch = "".obs;
  TextEditingController wordToSearchTextFormField = TextEditingController();

  List<List<int>> wordAtIndxes = [];

  updateGrid() {
    update();
  }
}
