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
      body: const Center(
        child: HeavyWidget(),
      ),
    );
  }
}