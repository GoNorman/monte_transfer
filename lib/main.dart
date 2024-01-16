import 'package:flutter/material.dart';
import 'package:monte_transfer/widgets/loading_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: LoadingScreen(),
    );
  }
}
