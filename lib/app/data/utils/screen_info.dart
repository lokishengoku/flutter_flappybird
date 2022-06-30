import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenInfo {
  static double screenWidth = 0;
  static double screenHeight = 0;

  static void init() {
    screenWidth = MediaQuery.of(Get.context!).size.width;
    screenHeight = MediaQuery.of(Get.context!).size.height - 50;
  }

  static double percentOfWidth(double w) => w / screenWidth;
  static double percentOfHeight(double h) => h / screenHeight;
  static double widthOfPercent(double percentW) => screenWidth * percentW;
  static double heightOfPercent(double percentH) => screenHeight * percentH;
}
