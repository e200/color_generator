import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            color: Colors.grey.withOpacity(.4),
            icon: Icon(Icons.camera_alt_outlined),
            onPressed: () async {
              final _source = await _getImageSource(context);
            },
          ),
          /* IconButton(
            color: Colors.grey.withOpacity(.4),
            icon: Icon(Icons.settings_outlined),
            onPressed: () {},
          ), */
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
}
