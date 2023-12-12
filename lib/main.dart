import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_loading_flutter/presentation/manager/route_manager.dart';
import 'package:lazy_loading_flutter/presentation/views/home.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   GetMaterialApp(
      initialRoute: MobileRoutes.initialRoute,
       getPages: RouteManager.fetchGetXMobileRoutes(),
      home: const Home()
    );
  }
}
