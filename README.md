# lazy_loading_flutter

A new Flutter project.

## Getting Started

# What is deferred loading?
Deferred loading allows you to split your Flutter web app into smaller, separate JavaScript bundles. This means that only the code needed for the initial rendering of the app is loaded first, reducing the initial download size and improving perceived loading speed. The remaining code is loaded on demand, as the user navigates through the app and interacts with different features.

# Benefits of deferred loading
Improved initial load time: By reducing the initial bundle size, deferred loading significantly improves the initial load time of your app, leading to a better user experience.
Faster page transitions: Smaller bundles also result in faster page transitions, making navigation within your app smoother and more responsive.
Reduced memory consumption: Deferred loading helps you avoid loading unused code, which can reduce memory consumption and improve overall performance.
Better SEO: Faster loading times and smoother interactions contribute to a better SEO score for your web app.

# Considerations:
Only works in release and profile mode: Deferred loading doesn't work in debug mode.
Increased complexity: Your app architecture needs to be designed to support deferred loading.
Performance overhead: Loading libraries dynamically can have a performance overhead.

# How to implement deferred loading in Flutter web
There are two main ways to implement deferred loading in Flutter web:
Flutter's built-in deferred imports: You can use the dart:async library's DeferredLibrary class to load code on demand. This approach requires more manual effort, as you need to explicitly mark the libraries and functions you want to defer.
Riveted (package): This popular package allows you to easily split your app into different modules and configure deferred loading for each module. Riveted also provides additional features like lazy loading and code splitting for specific routes.

# In this blog we will focus on Deferred imports

# Best practices for using deferred loading
Identify and defer non-critical code: Don't overuse deferred loading. Only defer code that is not needed for the initial rendering and is only accessed by specific user interactions.
Provide loading indicators: Show users clear loading indicators while deferred code is being downloaded and loaded. This helps manage user expectations and ensures a smooth experience.
Monitor performance: Use performance monitoring tools to track the impact of deferred loading on your app's performance and identify potential bottlenecks.
Consider code size: Be mindful of the size of your deferred bundles. Smaller bundles are downloaded and loaded faster, but they may require more frequent code splitting.


# 1. Example of Deferred Import 
This example demonstrates how to use deferred imports in a simple Flutter application:

``` 
1. Dependencies:
Add the following dependency to your pubspec.yaml:
YAML
dependencies:
flutter:
  sdk: flutter
main.dart:
import 'package:flutter/material.dart';
import 'heavy_widget.dart' deferred as heavy_widget;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget
 
{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Deferred Loading Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('This is the initial content.'),
              ElevatedButton(
                child: const Text('Load Heavy Widget'),
                onPressed: () async {
                  await heavy_widget.loadLibrary();
                 final HeavyWidgetPage = heavy_widget.HeavyWidgetPage();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HeavyWidgetPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

heavy_widget.dart:
import 'package:flutter/material.dart';

class HeavyWidget extends StatelessWidget {
  const HeavyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Text('This is the heavy widget.'),
    );
  }
}

class HeavyWidgetPage extends StatelessWidget {
  const HeavyWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Heavy Widget')),
      body: Center(
        child: const HeavyWidget(),
      ),
    );
  }
} 
```
# Explanation:
In main.dart, we import heavy_widget.dart using deferred as heavy_widget. This tells the compiler to treat the code in heavy_widget.dart as deferred.
We use an ElevatedButton to trigger the loading of the deferred library.
When the button is clicked, we use heavy_widget.loadLibrary() to download the code of the deferred library.
Once the library is loaded, we navigate to the HeavyWidgetPage using Navigator.push().
The HeavyWidgetPage displays the HeavyWidget, which is a simple container with text.

# 2. Example of Deferred Import 
```
main.dart:
import 'package:flutter/material.dart';
import 'heavy_widget.dart' deferred as heavy_widget;

void main() => runApp(const MyApp());

class
 
MyApp
 
extends
 
StatelessWidget
 
{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Deferred Loading Example')),
        body: Center(
          child: FutureBuilder<void>(
            future: heavy_widget.loadLibrary(),
            final HeavyWidgetPage = heavy_widget.HeavyWidgetPage();
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return
 
const CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              return ElevatedButton(
                child: const Text('Show Heavy Widget'),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HeavyWidgetPage()),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
heavy_widget.dart:
import 'package:flutter/material.dart';

class HeavyWidget extends StatelessWidget {
  const HeavyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Text('This is the heavy widget.'),
    );
  }
}

class HeavyWidgetPage extends StatelessWidget {
  const HeavyWidgetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Heavy Widget')),
      body: Center(
        child: const HeavyWidget(),
      ),
    );
  }
}
```
# Explanation:
In main.dart, we use FutureBuilder to manage the loading of the deferred library.
The future property of FutureBuilder is set to heavy_widget.loadLibrary(), which returns a Future<void> that completes when the library is loaded.
The builder property of FutureBuilder takes a snapshot of the future as an argument and builds the appropriate widget based on the state:ConnectionState.waiting: Shows a CircularProgressIndicator while the library is loading.
ConnectionState.done: If the library loaded successfully, it shows an ElevatedButton.
ConnectionState.error: Displays an error message if the library failed to load.
Clicking the ElevatedButton navigates to the HeavyWidgetPage.


# Benefits of using deferred imports:
Reduces the initial download size of your app.
Improves the initial loading time of your app.
Saves memory by only loading the code that is needed.

# Things to remember when using deferred imports:
Only use deferred imports for code that is not critical for the initial rendering of your app.
Always show a loading indicator while the deferred library is being downloaded.
Consider using a package like riveted to manage deferred imports and code splitting in your app.
This is a basic example of deferred imports in Flutter. You can use this technique to improve the performance of your app by reducing the initial download size and improving the loading time.


# Conclusion
Deferred loading is a valuable tool for improving performance and delivering a seamless user experience in Flutter web apps. By understanding its benefits, implementing it effectively, and following best practices, you can create web apps that are fast, responsive, and enjoyable to use.
Additional resources:
Flutter documentation: https://docs.flutter.dev/perf/deferred-components
Riveted package: https://medium.com/codechai/publishing-a-flutter-package-on-dart-pub-1e4e2931f83a
Optimizing performance in Flutter web apps: https://medium.com/fluttersg/the-art-of-flutter-flutter-web-383d5db568a0
