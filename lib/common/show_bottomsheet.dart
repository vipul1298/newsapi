import 'package:flutter/material.dart';
import 'package:get/get.dart';

showCustomBottomSheet(
    {@required Widget? widget, Color backgroundColor = Colors.white}) {
  return Get.bottomSheet(widget!,
      backgroundColor: backgroundColor, isDismissible: true);
}
