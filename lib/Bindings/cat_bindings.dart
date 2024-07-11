import 'package:get/get.dart';
import 'package:getx_mvvm_demo/ViewModel/cat_viewmodel.dart';

class CatBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<CatViewModel>(CatViewModel());
  }
}