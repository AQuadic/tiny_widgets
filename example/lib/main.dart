import 'package:flutter/material.dart';

import 'src/tiny_container_example.dart';

void main() => runApp(TinyApp());

class TinyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiny Widgets Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: TinyContainerExample(),
    );
  }
}
