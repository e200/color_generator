import 'package:color_generator/screens/home/widgets/color_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorSlider extends StatefulWidget {
  final String colorName;
  final Color color;
  final int value;
  final Color activeColor;
  final Function(int value) onChanged;

  const ColorSlider({
    Key key,
    this.color,
    this.colorName,
    this.value,
    this.activeColor,
    this.onChanged,
  }) : super(key: key);

  @override
  _ColorSliderState createState() => _ColorSliderState();
}

class _ColorSliderState extends State<ColorSlider>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<int> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300,
      ),
    );

    _setupAnimation(0, 255);

    super.initState();
  }

  _setupAnimation(int from, int to) {
    _animation = IntTween(begin: from, end: to).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.bounceInOut,
      ),
    );

    _animationController.addListener(() {
      setState(() {});
    });

    _animationController.forward(from: 0);
  }

  @override
  void didUpdateWidget(covariant ColorSlider oldWidget) {
    if (oldWidget.value != widget.value) {
      _setupAnimation(oldWidget.value, widget.value);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.black.withOpacity(.1),
          ),
          child: Text(
            widget.colorName[0],
            style: TextStyle(
              color: Colors.white.withOpacity(.6),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ColorTextField(
          color: widget.color,
          value: _animation.value.toString(),
          onChanged: (value) => widget.onChanged(int.parse(value)),
        ),
        SizedBox(height: 15),
        RotatedBox(
          quarterTurns: 3,
          child: CupertinoSlider(
            min: 0,
            max: 255,
            thumbColor: widget.activeColor,
            activeColor: widget.activeColor.withOpacity(.5),
            value: _animation.value.toDouble(),
            onChanged: (value) => widget.onChanged(value.toInt()),
          ),
        ),
      ],
    );
  }

  Color contrastColor(Color color) =>
      color.computeLuminance() > .5 ? Colors.black : Colors.white;
}
