import 'package:color_generator/cubit/color_cubit.dart';
import 'package:color_generator/screens/home/screen.dart';
import 'package:color_generator/services/coolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorGeneratorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ColorCubit(coolor: Coolor()),
      child: MaterialApp(
        title: 'Color Generator',
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
