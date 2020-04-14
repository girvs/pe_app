import 'package:flutter/material.dart';

class IconWordButton extends StatelessWidget {
  final String text;
  final Icon icon;
  final GestureTapCallback func;
  const IconWordButton({Key key, this.text, this.icon, this.func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12, width: 1), //边框
              borderRadius: BorderRadius.all(
                //圆角
                Radius.circular(8.0),
              ),
            ),
            child: icon,
          ),
          onTap: func,
        ),
        SizedBox(height: 3,),
        Center(
          child: Text(text,style: TextStyle(fontSize: 12),),
        )
      ],
    );
  }
}
