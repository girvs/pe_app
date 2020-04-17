import 'package:flutter/material.dart';

class SpaceSizeBox extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry margin;

  const SpaceSizeBox({Key key, this.width, this.height = 15.0, this.margin})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      decoration: new BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: new Border.all(width: 0.1, color: Colors.black38),
      ),
    );
  }
}
