import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:newsapp/controllers/network_controller.dart';
import 'package:newsapp/controllers/news_controller.dart';

class AllControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkController>(() => NetworkController(), fenix: true);
    Get.lazyPut<NewsController>(() => NewsController(), fenix: true);
  }
}
