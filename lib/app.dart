import 'package:color_generator/screens/home/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorGeneratorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Color Generator',
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
