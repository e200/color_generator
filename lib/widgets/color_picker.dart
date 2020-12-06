import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image/image.dart' as img;

class ColorPicker extends StatefulWidget {
  final File image;
  final Function(Color color) onSelectColor;

  const ColorPicker({
    Key key,
    this.image,
    this.onSelectColor,
  }) : super(key: key);

  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  GlobalKey _imageKey = GlobalKey();
  GlobalKey _paintKey = GlobalKey();

  // CHANGE THIS FLAG TO TEST BASIC IMAGE, AND SNAPSHOT.
  bool _useSnapshot = true;

  // based on useSnapshot=true ? paintKey : imageKey ;
  // this key is used in this example to keep the code shorter.
  GlobalKey _currentKey;

  final StreamController<Color> _stateController = StreamController<Color>();
  img.Image photo;

  @override
  void initState() {
    _currentKey = _useSnapshot ? _paintKey : _imageKey;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _stateController.close();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: Colors.grey,
      stream: _stateController.stream,
      builder: (buildContext, snapshot) {
        Color selectedColor = snapshot.data;

        widget.onSelectColor(selectedColor);

        return Stack(
          children: <Widget>[
            InteractiveViewer(
              child: RepaintBoundary(
                key: _paintKey,
                child: GestureDetector(
                  onPanDown: (details) {
                    _searchPixel(details.globalPosition);
                  },
                  onPanUpdate: (details) {
                    _searchPixel(details.globalPosition);
                  },
                  child: Center(
                    child: Image.file(
                      widget.image,
                      key: _imageKey,
                      //color: Colors.red,
                      //colorBlendMode: BlendMode.hue,
                      //alignment: Alignment.bottomRight,
                      fit: BoxFit.none,
                      //scale: .8,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(70),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selectedColor,
                border: Border.all(width: 2.0, color: Colors.white),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void _searchPixel(Offset globalPosition) async {
    if (photo == null) {
      await (_useSnapshot ? loadSnapshotBytes() : loadImageBundleBytes());
    }
    _calculatePixel(globalPosition);
  }

  void _calculatePixel(Offset globalPosition) {
    RenderBox box = _currentKey.currentContext.findRenderObject();
    final localPosition = box.globalToLocal(globalPosition);

    double px = localPosition.dx;
    double py = localPosition.dy;

    if (!_useSnapshot) {
      double widgetScale = box.size.width / photo.width;

      px = (px / widgetScale);
      py = (py / widgetScale);
    }

    final pixel32 = photo.getPixelSafe(px.toInt(), py.toInt());
    final hex = abgrToArgb(pixel32);

    _stateController.add(Color(hex));
  }

  Future<void> loadImageBundleBytes() async {
    final _bytes = await widget.image.readAsBytes();

    final imageBytes = ByteData.view(_bytes.buffer);

    setImageBytes(imageBytes);
  }

  Future<void> loadSnapshotBytes() async {
    RenderRepaintBoundary boxPaint =
        _paintKey.currentContext.findRenderObject();

    ui.Image capture = await boxPaint.toImage();

    ByteData imageBytes =
        await capture.toByteData(format: ui.ImageByteFormat.png);

    setImageBytes(imageBytes);

    capture.dispose();
  }

  void setImageBytes(ByteData imageBytes) {
    List<int> values = imageBytes.buffer.asUint8List();

    photo = null;

    photo = img.decodeImage(values);
  }
}

// image lib uses uses KML color format, convert #AABBGGRR to regular #AARRGGBB
int abgrToArgb(int argbColor) {
  int r = (argbColor >> 16) & 0xFF;

  int b = argbColor & 0xFF;

  return (argbColor & 0xFF00FF00) | (b << 16) | r;
}
