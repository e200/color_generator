import 'package:color_generator/modules/color/color_notifier.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, _) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
        color: watch(colorNotifier).color.withOpacity(1),
      );
    });
  }
}
