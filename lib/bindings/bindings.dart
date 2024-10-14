import 'package:get/get.dart';
import 'package:ricomusic/controlleres/dashboard_controller.dart';
import 'package:ricomusic/controlleres/likeController.dart';
import 'package:ricomusic/controlleres/search_controller.dart';

class MyBindings extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => SearchLogic());
    Get.lazyPut(() => LikeController());

  }
}