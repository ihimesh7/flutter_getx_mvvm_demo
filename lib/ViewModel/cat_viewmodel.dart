import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_demo/APIService/cat_api_service.dart';
import 'package:getx_mvvm_demo/Model/cat.dart';

class CatViewModel extends GetxController {
  final _apiService = CatApiService();
  final _cat = Cat(url: '').obs;
  final _isLoading = false.obs;
  final _hasError = false.obs;

  Cat? get cat => _cat.value;
  bool get isLoading => _isLoading.value;
  bool get hasError => _hasError.value;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchRandomCat();
  }

  Future<void> fetchRandomCat() async {
    _isLoading.value = true;
    _hasError.value = false;

    try {
      final cat = await _apiService.getRandomCat();
      _cat.value = cat;
    } on Exception catch (e) {
      _hasError.value = true;
      debugPrint('Error fetching cat images: $e');
    } finally {
      _isLoading.value = false;
    }
  }

}