import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jitak_non_getex/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jitak Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        // You can use Get.theme instead of ThemeData for theme changes
      ),
      home: const Home(),
    );
  }
}
