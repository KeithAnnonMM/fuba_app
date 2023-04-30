import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fuba_app/controllers/auth_controller.dart';
import 'package:get/get.dart';

import 'views/welcome.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const Welcome()),
      ],
    );
  }
}
