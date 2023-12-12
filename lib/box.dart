import 'package:flutter/material.dart';

class DeferredBox extends StatelessWidget {
  const DeferredBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Text('Deferred Box'),
    );
  }
}