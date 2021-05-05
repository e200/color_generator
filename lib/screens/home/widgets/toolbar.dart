import 'dart:io';

import 'package:color_generator/modules/color/color_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:color_generator/screens/image_color_picker/screen.dart';
import 'package:url_launcher/url_launcher.dart';

class Toolbar extends StatelessWidget {
  const Toolbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final _color = watch(colorNotifier).color;
        final _contrastedBackgroundColor =
            contrastColor(_color).withOpacity(.4);

        return Container(
          margin: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.black.withOpacity(.075),
          ),
          child: Wrap(
            children: [
              IconButton(
                tooltip: 'Pick colors from photos or camera',
                color: _contrastedBackgroundColor,
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
                      context.read(colorNotifier.notifier).updateColor(_color);
                    }
                  }
                },
              ),
              IconButton(
                tooltip: 'Reset color values',
                color: _contrastedBackgroundColor,
                icon: Icon(Icons.refresh_outlined),
                onPressed: () {
                  context.read(colorNotifier.notifier).updateColor(Colors.white);
                },
              ),
              IconButton(
                tooltip: 'Generates a random color',
                color: _contrastedBackgroundColor,
                icon: Icon(Icons.shuffle_outlined),
                onPressed: () {
                  context.read(colorNotifier.notifier).updateWithRandomColor();
                },
              ),
              IconButton(
                tooltip: 'About this app',
                color: _contrastedBackgroundColor,
                icon: Icon(Icons.info_outline),
                onPressed: () => _showAboutDialog(context),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<ImageSource?> _getImageSource(BuildContext context) async {
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

  // TODO: Move this logic out of this widget
  Future<File?> _getImage(BuildContext context, ImageSource? source) async {
    if (source != null) {
      final _imagePicker = ImagePicker();

      try {
        final _pickedImage = await _imagePicker.getImage(source: source);

        return _pickedImage != null ? File(_pickedImage.path) : null;
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

        ScaffoldMessenger.of(context).showSnackBar(_snackbar);
      }
    }
  }

  _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationVersion: 'v0.0.2',
      applicationIcon: Image.asset(
        'assets/logo.png',
        width: 50,
      ),
      children: [
        Wrap(
          children: [
            Text('With '),
            Icon(
              Icons.favorite,
              size: 20,
              color: Colors.red,
            ),
            Text(' by '),
            GestureDetector(
              child: Text(
                'Eleandro Duzentos',
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                launch('https://github.com/e200');
              },
            ),
          ],
        ),
      ],
    );
  }
}
