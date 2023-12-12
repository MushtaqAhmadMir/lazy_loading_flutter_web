import 'package:get/get.dart';
import 'package:lazy_loading_flutter/presentation/manager/route_manager.dart';
import 'package:lazy_loading_flutter/presentation/views/heavy_widget.dart'
    deferred as heavy_widget;

class NavigationManager {
  static void onBackPressed({int times = 1}) {
    // times represent the number of times onBackPressed will be called.
    // if we pass times as 3, then 3 screens will be closed.
    Get.close(times);
  }

  static void gotoHeavyWidget() async {
    // await heavy_widget.loadLibrary();
    Get.toNamed(MobileRoutes.heavyWidget);
  }
}
