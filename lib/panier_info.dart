import 'package:flutter/material.dart';

class PanierInfo extends StatelessWidget {
  String _image;
  int _price;

  PanierInfo(this._image, this._price, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Icon(
            Icons.delete,
            color: Colors.black,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 20, 10),
            child: Image.asset(_image, width: 200, height: 94),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(_price.toString() + " TND", textScaleFactor: 2)],
          )
        ],
      ),
    );
  }
}
