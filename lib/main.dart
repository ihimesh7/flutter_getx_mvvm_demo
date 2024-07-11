import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_demo/Bindings/cat_bindings.dart';
import 'package:getx_mvvm_demo/View/cat_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: CatBindings(),
      title: 'GetX MVVM Demo',
      home: CatPage(),
      );
  }
}


