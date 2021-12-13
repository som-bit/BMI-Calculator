import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  // creating a constructor to change the color
  // The annotation required makes it a must to add color when we call this methode
  ReusableCard({@required this.color, this.usableCardChild, this.onPress});
  final Color color;
  final Widget usableCardChild;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: usableCardChild,
      ),
    );
  }
}
