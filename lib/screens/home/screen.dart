import 'package:color_generator/cubit/color_cubit.dart';
import 'package:color_generator/screens/home/widgets/color_slider.dart';
import 'package:color_generator/screens/home/widgets/hexa.dart';
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
                            onChanged: (String hexadecimal) {
                              context.read<ColorCubit>().updateHexa(hexadecimal);
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
