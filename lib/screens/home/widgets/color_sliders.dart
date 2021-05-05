import 'package:color_generator/modules/color/color_notifier.dart';
import 'package:color_generator/screens/home/widgets/color_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorSliders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        final _color = watch(colorNotifier).color;

        return SizedBox(
          width: 250,
          child: Row(
            children: [
              Expanded(
                child: ColorSlider(
                  color: _color,
                  colorName: 'Red',
                  activeColor: Colors.red,
                  value: _color.red,
                  onChanged: (value) {
                    context.read(colorNotifier.notifier).updateRed(value);
                  },
                ),
              ),
              Expanded(
                child: ColorSlider(
                  color: _color,
                  colorName: 'Green',
                  activeColor: Colors.green,
                  value: _color.green,
                  onChanged: (value) {
                    context.read(colorNotifier.notifier).updateGreen(value);
                  },
                ),
              ),
              Expanded(
                child: ColorSlider(
                  color: _color,
                  colorName: 'Blue',
                  activeColor: Colors.blue,
                  value: _color.blue,
                  onChanged: (value) {
                    context.read(colorNotifier.notifier).updateBlue(value);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
