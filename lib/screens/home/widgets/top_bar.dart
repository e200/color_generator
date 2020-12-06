import 'package:flutter/material.dart';

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
}
