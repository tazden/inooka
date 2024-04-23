import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:word_game/app/routes/app_pages.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      // Check if the tick number is 5
      if (timer.tick == 3) {
        timer.cancel();
        Get.offNamed(Routes.HOME);
        // Code to Run
      }
    });
    return Scaffold(
        backgroundColor: Colors.yellow,
        body: Center(
            child: Text(
          "Search\nThe\nWord",
          textAlign: TextAlign.center,
          style: GoogleFonts.jockeyOne(
              fontWeight: FontWeight.w600, fontSize: 80, color: Colors.white),
        )));
  }
}
