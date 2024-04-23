import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:word_game/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('HomeView'),
        //   centerTitle: true,
        // ),
        body: Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Number Of Rows",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 4,
          ),
          TextFormField(
            controller: controller.rowCount,
            keyboardType: TextInputType.number,
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
              hintText: "Enter number of rows",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                  width: 0.5,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Number Of Column",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 4,
          ),
          TextFormField(
            controller: controller.columnCount,
            keyboardType: TextInputType.number,
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
              hintText: "Enter number of column",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                  width: 0.5,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 40,
            child: ElevatedButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero))),
              onPressed: () {
                Get.toNamed(Routes.GAME_SCREEN, arguments: [
                  controller.rowCount.text,
                  controller.columnCount.text
                ]);
              },
              child: Text(
                "Start",
                style: TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
