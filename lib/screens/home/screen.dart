import 'package:color_generator/cubit/color_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _color = context.watch<ColorCubit>().state.color;

    return Scaffold(
      body: Builder(
        builder: (context) {
          return Stack(
            children: [
              Container(color: _color),
              SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Hexa(
                            color: _color,
                            onTap: () {
                              final _hexa = getHexadecimalFromColor(_color);

                              _setClipboardText(context, _hexa);
                            },
                            onLongPress: () {
                              _showValuePickerDialog(
                                context: context,
                                initialValue: getHexadecimalFromColor(_color),
                                onSubmit: (hexa) {
                                  context.read<ColorCubit>().updateHexa(hexa);
                                },
                              );
                            },
                          ),
                          SizedBox(height: 60),
                          Row(
                            children: [
                              Expanded(
                                child: ColorSlider(
                                  colorName: 'Red',
                                  activeColor: Colors.red,
                                  value: _color.red,
                                  onChange: (value) {
                                    context.read<ColorCubit>().updateRed(value);
                                  },
                                  onTapLabel: () {
                                    _setClipboardText(
                                      context,
                                      _color.red.toString(),
                                    );
                                  },
                                  onLongPressLabel: () {
                                    _showValuePickerDialog(
                                      context: context,
                                      initialValue: _color.red.toString(),
                                      inputType:
                                          TextInputType.numberWithOptions(
                                        decimal: false,
                                        signed: false,
                                      ),
                                      onSubmit: (value) {
                                        final _intColor = int.parse(value);

                                        context
                                            .read<ColorCubit>()
                                            .updateRed(_intColor);
                                      },
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: ColorSlider(
                                  colorName: 'Green',
                                  activeColor: Colors.green,
                                  value: _color.green,
                                  onChange: (value) {
                                    context
                                        .read<ColorCubit>()
                                        .updateGreen(value);
                                  },
                                  onTapLabel: () {
                                    _setClipboardText(
                                      context,
                                      _color.green.toString(),
                                    );
                                  },
                                  onLongPressLabel: () {
                                    _showValuePickerDialog(
                                      context: context,
                                      initialValue: _color.green.toString(),
                                      inputType:
                                          TextInputType.numberWithOptions(
                                        decimal: false,
                                        signed: false,
                                      ),
                                      onSubmit: (value) {
                                        final _intColor = int.parse(value);

                                        context
                                            .read<ColorCubit>()
                                            .updateGreen(_intColor);
                                      },
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: ColorSlider(
                                  colorName: 'Blue',
                                  activeColor: Colors.blue,
                                  value: _color.blue,
                                  onChange: (value) {
                                    context
                                        .read<ColorCubit>()
                                        .updateBlue(value);
                                  },
                                  onTapLabel: () {
                                    _setClipboardText(
                                      context,
                                      _color.blue.toString(),
                                    );
                                  },
                                  onLongPressLabel: () {
                                    _showValuePickerDialog(
                                      context: context,
                                      initialValue: _color.blue.toString(),
                                      inputType:
                                          TextInputType.numberWithOptions(
                                        decimal: false,
                                        signed: false,
                                      ),
                                      onSubmit: (value) {
                                        final _intColor = int.parse(value);

                                        context
                                            .read<ColorCubit>()
                                            .updateBlue(_intColor);
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  _setClipboardText(BuildContext context, String text) async {
    Scaffold.of(context).hideCurrentSnackBar();

    await Clipboard.setData(ClipboardData(text: text));

    final _snackbar = SnackBar(
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          Icon(Icons.assignment),
          SizedBox(width: 15),
          Text('Copied to clipboard'),
        ],
      ),
    );

    Scaffold.of(context).showSnackBar(_snackbar);
  }
}

class Hexa extends StatelessWidget {
  final Color color;
  final Function() onTap;
  final Function() onLongPress;

  const Hexa({
    Key key,
    this.color,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _hexa = getHexadecimalFromColor(color);

    return GestureDetector(
      onLongPress: onLongPress,
      child: SelectableText(
        _hexa,
        onTap: onTap,
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: color.computeLuminance() > .5 ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}

class ColorSlider extends StatelessWidget {
  final String colorName;
  final int value;
  final Color activeColor;
  final Function(int value) onChange;
  final Function() onTapLabel;
  final Function(int value) onInputValue;
  final Function() onLongPressLabel;

  const ColorSlider({
    Key key,
    this.colorName,
    this.value,
    this.activeColor,
    this.onChange,
    this.onTapLabel,
    this.onInputValue,
    this.onLongPressLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _color = context.watch<ColorCubit>().state.color;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          colorName[0],
          style: TextStyle(
            color: Colors.grey.withOpacity(.6),
            fontWeight: FontWeight.bold,
          ),
        ),
        FlatButton(
          highlightColor: contrastColor(_color).withOpacity(.1),
          splashColor: activeColor.withOpacity(.2),
          child: Text(
            value.toString(),
            style: TextStyle(
              color: contrastColor(_color),
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: onTapLabel,
          onLongPress: onLongPressLabel,
        ),
        SizedBox(height: 15),
        RotatedBox(
          quarterTurns: 3,
          child: CupertinoSlider(
            min: 0,
            max: 255,
            thumbColor: activeColor,
            activeColor: activeColor.withOpacity(.5),
            value: value.toDouble(),
            onChanged: (value) => onChange(value.toInt()),
          ),
        ),
      ],
    );
  }

  Color contrastColor(Color color) =>
      color.computeLuminance() > .5 ? Colors.black : Colors.white;
}

_showValuePickerDialog({
  BuildContext context,
  String initialValue,
  Function(String value) onSubmit,
  TextInputType inputType,
}) {
  final _focusNode = FocusNode();
  final _inputController = TextEditingController(
    text: initialValue,
  );

  _focusNode.requestFocus();

  showDialog(
    context: context,
    child: AlertDialog(
      title: Text('Input value'),
      content: TextFormField(
        focusNode: _focusNode,
        controller: _inputController,
        decoration: InputDecoration(labelText: 'Color value'),
        keyboardType: inputType,
      ),
      actions: [
        FlatButton(
          onPressed: () {
            final _value = _inputController.text;

            if (_value.isNotEmpty && _value != initialValue) {
              onSubmit(_value);
            }

            Navigator.pop(context);
          },
          child: Text('Ok'),
        ),
      ],
    ),
  );
}

String getHexadecimalFromColor(Color color) {
  final _colorString = color.toString().substring(10, 16).toUpperCase();
  final _hexaColorString = '#' + _colorString;

  return _hexaColorString;
}
