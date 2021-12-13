import 'package:flutter/material.dart';
import 'constant.dart';

class myIcon extends StatelessWidget {
  myIcon({this.lable, this.iconData});
  final IconData iconData;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          iconData,
          size: 100.0,
        ),
        SizedBox(
          height: 30.0,
        ),
        Text(lable, style: kLableStyle)
      ],
    );
  }
}
