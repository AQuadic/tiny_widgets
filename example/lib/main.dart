import 'package:flutter/material.dart';
import 'package:tiny_widgets_example/src/tiny_container.dart';

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
