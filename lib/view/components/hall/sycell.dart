import 'package:flutter/material.dart';
import 'package:pe_app/style/theme.dart';

class SyCell extends StatelessWidget {
  final Widget icon;
  final String title;
  final String endText;
  final VoidCallback onTap;
  final bool isShowLine;
  Widget endIcon = Icon(Icons.navigate_next, color: Colors.black45);

  SyCell(
      {@required this.title,
      this.icon,
      this.onTap,
      this.endIcon,
      this.endText: '',
      this.isShowLine});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return new InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left:15.0,right: 15.0,top: 12,bottom: 12),
        decoration: BoxDecoration(
          color:Constants.containerColor,
          border: isShowLine
              ? Border(bottom: BorderSide(color: theme.dividerColor,width: 0.5))
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            icon != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child: icon,
                  )
                : Container(),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left:15),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            Text(endText),
            SizedBox(
              width: 10,
            ),
            onTap == null ? Container() : endIcon
          ],
        ),
      ),
    );
  }
}
