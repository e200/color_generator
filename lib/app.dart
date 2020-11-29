import 'package:color_generator/screens/home/screen.dart';
import 'package:flutter/material.dart';

class ColorGeneratorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Generator',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
