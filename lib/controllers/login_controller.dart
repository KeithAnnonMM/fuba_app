import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isVisible = true.obs;

  void changeOption() {
    isVisible.value = !isVisible.value;
  }
}
