import 'package:get/get.dart';
import 'package:lazy_loading_flutter/presentation/views/box.dart';
import 'package:lazy_loading_flutter/presentation/views/heavy_widget.dart';
import 'package:lazy_loading_flutter/presentation/views/home.dart';
class RouteManager {
  static List<GetPage> fetchGetXMobileRoutes() {
    return [
       GetPage(
        name: MobileRoutes.initialRoute,
        page: () => const Home(),
      ),
      GetPage(
        name: MobileRoutes.heavyWidget,
        page: () => const HeavyWidgetPage(),
      ),
      GetPage(
        name: MobileRoutes.box,
        page: () => const DeferredBox(),
      ),];
     
  }
}

class MobileRoutes {
  static const String initialRoute = '/home';
  static const String box = '/box';
  static const String heavyWidget = '/heavy_widget';
}