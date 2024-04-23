import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/search_word_controller.dart';

class SearchWordView extends GetView<SearchWordController> {
  const SearchWordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Word'),
        centerTitle: true,
      ),
      body: GetBuilder<SearchWordController>(builder: (_) {
        return Column(
          children: [
            SizedBox(
              height: 50,
            ),
            for (int i = 0; i < controller.rowCount.value; i++) ...{
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int j = 0; j < controller.columnCount.value; j++) ...{
                    ContainerTextWidget(controller: controller, i: i, j: j)
                  }
                ],
              ),
            },
            Spacer(),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width - 150,
                child: TextFormField(
                  controller: controller.wordToSearchTextFormField,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                      top: 5,
                      left: 16,
                    ),
                    // suffixIcon: textFormIcon,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(),
                    ),
                    hintText: "Enter word to search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        width: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              ElevatedButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.zero))),
                  onPressed: () {
                    controller.wordToSearch.value =
                        controller.wordToSearchTextFormField.text.toString();

                    if (controller.wordToSearch.value.isNotEmpty &&
                        controller.wordToSearch.value.length >= 3) {
                      searchWord();
                    } else {
                      Get.snackbar(
                          "Error", "Please Enter Word With Length More Then 2");
                    }
                    controller.updateGrid();
                  },
                  child: Text("Search")),
            ]),
            SizedBox(
              width: MediaQuery.of(context).size.width - 50,
              child: ElevatedButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.zero))),
                  onPressed: () {
                    controller.wordAtIndxes.clear();
                    controller.updateGrid();
                  },
                  child: Text("Clear ")),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        );
      }),
    );
  }

  searchWord() {
    var searchFirstCharecter = controller.wordToSearch.value[0].toString();
    print(searchFirstCharecter.toString());

    bool isHorizontal = false;
    bool isVertical = false;
    bool isDigonal = false;

    for (int i = 0; i < controller.rowCount.value; i++) {
      for (int j = 0; j < controller.columnCount.value; j++) {
        if (controller.textFieldController[i][j].text == searchFirstCharecter) {
          print("$i , $j");
          isHorizontal = isHorizontal || checkHorizontal(i, j);
          isVertical = isVertical || checkVertical(i, j);
          isDigonal = isDigonal || checkDigonalRightToLeft(i, j);
          // break
        }
      }
    }

    if (isHorizontal) {
      print(controller.wordAtIndxes);
      Get.snackbar(
        "Congrulations",
        "Word Found Horizontally",
        backgroundColor: Colors.green.withOpacity(0.6),
      );
    } else if (isVertical) {
      print(controller.wordAtIndxes);
      Get.snackbar(
        "Congrulations",
        "Word Found Vertically",
        backgroundColor: Colors.green.withOpacity(0.6),
      );
    } else if (isDigonal) {
      print(controller.wordAtIndxes);
      Get.snackbar(
        "Congrulations",
        "Word Found Vertically",
        backgroundColor: Colors.green.withOpacity(0.6),
      );
    } else {
      Get.snackbar(
        "Opps..",
        "Word Not Found",
        backgroundColor: Colors.red.withOpacity(0.6),
      );
    }
  }

  bool checkHorizontal(int atRow, int atColumn) {
    List<List<int>> temp = [];
    var word = "";
    for (int i = atColumn;
        i < atColumn + controller.wordToSearch.value.length;
        i++) {
      if ((i < controller.columnCount.value)) {
        word = word + controller.textFieldController[atRow][i].text;
        temp.add([atRow, i]);

        if (word == controller.wordToSearch.value &&
            word.length == temp.length) {
          controller.wordAtIndxes.clear();
          controller.wordAtIndxes.addAll(temp);
        }
      }
    }
    if (word == controller.wordToSearch.value) {
      print("&&&&&&&&&&&&&&&&&&");
      print("We found it horizontal");
      print("&&&&&&&&&&&&&&&&&&");
      return true;
    } else {
      // print("Not found");
      return false;
    }
  }

  bool checkVertical(int atRow, int atColumn) {
    List<List<int>> temp = [];
    var word = "";
    for (int i = atRow; i < atRow + controller.wordToSearch.value.length; i++) {
      if ((i < controller.rowCount.value)) {
        word = word + controller.textFieldController[i][atColumn].text;

        temp.add([i, atColumn]);

        if (word == controller.wordToSearch.value &&
            word.length == temp.length) {
          controller.wordAtIndxes.clear();
          controller.wordAtIndxes.addAll(temp);
        }
      }
    }
    if (word == controller.wordToSearch.value) {
      print("&&&&&&&&&&&&&&&&&&");
      print("We found it vertical");
      print("&&&&&&&&&&&&&&&&&&");
      return true;
    } else {
      // print("Not found");
      return false;
    }
  }

  bool checkDigonalRightToLeft(int atRow, int atColumn) {
    List<List<int>> temp = [];
    var word = "";
    for (int i = atRow; i < atRow + controller.wordToSearch.value.length; i++) {
      for (int j = atColumn;
          j < atColumn + controller.wordToSearch.value.length;
          j++) {
        if ((i < controller.rowCount.value) &&
            (j < controller.columnCount.value)) {
          word = word + controller.textFieldController[i][j].text;
          temp.add([i, j]);

          if (word == controller.wordToSearch.value &&
              word.length == temp.length) {
            controller.wordAtIndxes.clear();
            controller.wordAtIndxes.addAll(temp);
          }
          i++;
        }
      }
    }
    if (word == controller.wordToSearch.value) {
      print("&&&&&&&&&&&&&&&&&&");
      print("We found it digonal");
      print("&&&&&&&&&&&&&&&&&&");
      return true;
    } else {
      // print("Not found");
      return false;
    }
  }
}

class ContainerTextWidget extends StatelessWidget {
  const ContainerTextWidget({
    super.key,
    required this.controller,
    required this.i,
    required this.j,
  });

  final SearchWordController controller;
  final int i;
  final int j;

  @override
  Widget build(BuildContext context) {
    var op = [i, j];
    return Container(
      alignment: Alignment.center,
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(),
        color: checkWordContainsOrNot(op) ? Colors.red : null,
      ),
      child: Text(
        controller.textFieldController[i][j].text,
      ),
    );
  }

  bool checkWordContainsOrNot(List<int> list) {
    int index = controller.wordAtIndxes.indexWhere(
        (sublist) => sublist[0] == list[0] && sublist[1] == list[1]);
    if (index != -1) {
      return true;
    } else {
      return false;
    }
  }
}
