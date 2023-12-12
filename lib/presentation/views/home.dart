import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_loading_flutter/presentation/manager/navigation_manager.dart';
import 'package:lazy_loading_flutter/presentation/views/heavy_widget.dart';
import 'box.dart' deferred as box; // Import deferred
 import 'heavy_widget.dart' deferred as heavy_widget;

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Deferred Loading Example')),
      body: Column(
        children: [
          FutureBuilder<void>(
            future: box.loadLibrary(), // Load the deferred library
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                // Build the widget using the deferred library
                return box.DeferredBox();
              }
              return const CircularProgressIndicator();
            },
          ),
          ElevatedButton(
            child: const Text('Load Heavy Widget'),
            onPressed: () async {

              await heavy_widget.loadLibrary();
               final heavyWidget = heavy_widget.HeavyWidgetPage();
              //  Get.to(() => heavyWidget);
              //  Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => heavyWidget),
              //   );
            NavigationManager.gotoHeavyWidget();
            },
          ),
        ],
      ),
    );
  }
}
