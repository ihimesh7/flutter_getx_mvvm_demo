import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_demo/Utility/common_widget_components.dart';
import 'package:getx_mvvm_demo/View/login_page.dart';
import 'package:getx_mvvm_demo/ViewModel/cat_viewmodel.dart';

class SecondCatPage extends StatelessWidget {
  final catViewModel = Get.find<CatViewModel>();

  SecondCatPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text('Random cat'),),
      body:
      Obx(() =>
      catViewModel.isLoading ?
      const Center(child: CircularProgressIndicator(),)
          :
      catViewModel.hasError ?
      const Center(child: Text('Error fetching cat image'),)
          :
      catViewModel.cat != null ?
      Image.network(catViewModel.cat!.url)
          :
      const Center(child: Text('No cat found yet'),)
      ),
      floatingActionButton:
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: catViewModel.fetchRandomCat,
            heroTag: 'refresh',
            child: const Icon(Icons.refresh),
          ),
          buttonSpacing,
          FloatingActionButton(
            onPressed: () => Get.to(() => LoginPage()),
            heroTag: 'next',
            child: const Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }
}