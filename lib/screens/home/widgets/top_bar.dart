import 'dart:io';

import 'package:color_generator/cubit/color_cubit.dart';
import 'package:color_generator/screens/image_color_picker/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _color = context.watch<ColorCubit>().state.color;

    return Container(
      margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.black.withOpacity(.1),
      ),
      child: Wrap(
        children: [
          IconButton(
            tooltip: 'Pick colors from your photos or camera',
            color: contrastColor(_color).withOpacity(.4),
            icon: Icon(Icons.camera_alt_outlined),
            onPressed: () async {
              final _source = await _getImageSource(context);

              final _image = await _getImage(context, _source);

              if (_image != null) {
                final _color = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ImageColorPickerScreen(
                        image: _image,
                      );
                    },
                  ),
                );

                if (_color != null) {
                  context.read<ColorCubit>().updateColor(_color);
                }
              }
            },
          ),
          IconButton(
            tooltip: 'Reset color values',
            color: contrastColor(_color).withOpacity(.4),
            icon: Icon(Icons.refresh_outlined),
            onPressed: () {
              context.read<ColorCubit>().updateColor(Colors.white);
            },
          ),
          IconButton(
            tooltip: 'Generates a random color',
            color: contrastColor(_color).withOpacity(.4),
            icon: Icon(Icons.shuffle_outlined),
            onPressed: () {
              context.read<ColorCubit>().updateWithRandomColor();
            },
          ),
          IconButton(
            tooltip: 'Copy to clipboard',
            color: contrastColor(_color).withOpacity(.4),
            icon: Icon(Icons.copy_outlined),
            onPressed: () {},
          ),
          IconButton(
            tooltip: 'About this app',
            color: contrastColor(_color).withOpacity(.4),
            icon: Icon(Icons.info_outline),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Future<ImageSource> _getImageSource(BuildContext context) async {
    final _option = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          shrinkWrap: true,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.camera_alt_outlined),
              title: Text('Camera'),
              onTap: () {
                Navigator.pop(context, ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(Icons.collections_outlined),
              title: Text('Gallery'),
              onTap: () {
                Navigator.pop(context, ImageSource.gallery);
              },
            ),
          ],
        );
      },
    );

    return _option;
  }

  Color contrastColor(Color color) =>
      color.computeLuminance() > .5 ? Colors.black : Colors.white;

  // TODO: Move this code to its own Cubit
  Future<File> _getImage(BuildContext context, ImageSource source) async {
    if (source != null) {
      final _imagePicker = ImagePicker();

      try {
        final _pickedImage = await _imagePicker.getImage(source: source);

        return File(_pickedImage.path);
      } on PlatformException catch (_) {
        final _snackbar = SnackBar(
          content: Text('Permission to read gallery denied'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 5),
          action: SnackBarAction(
            label: 'Try again',
            textColor: Colors.white,
            onPressed: () {
              _getImage(context, source);
            },
          ),
        );

        Scaffold.of(context).showSnackBar(_snackbar);
      }
    }

    return null;
  }
}
