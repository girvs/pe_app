import 'dart:async';

import 'package:bubble/bubble.dart';
import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bubble/bubble_widget.dart';

class Message {
  String text;
  bool isSelf;
  DateTime chatTime;

  Message(this.text, this.isSelf, this.chatTime);
}

class MessageItem extends StatefulWidget {
  final List<Message> messages;
  final bool isDarkMode;
  final double iWidth;
  final String selfImageUrl;
  final String someImageUrl;
  final GestureTapCallback itemCallBack;
  const MessageItem(
      {Key key,
      this.messages,
      this.isDarkMode,
      this.iWidth,
      this.selfImageUrl,
      this.someImageUrl,
      this.itemCallBack})
      : super(key: key);
  @override
  _MessageItemState createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {
  ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    if (widget.messages.length > 0)
      Timer(Duration(milliseconds: 0),
          () => _controller.jumpTo(_controller.position.maxScrollExtent));
    return ListView(
      controller: _controller,
      children: _buildContent(widget.iWidth),
    );
  }

  _buildContent(double iWidth) {
    List<Widget> contents = [];
    for (var message in widget.messages) {
      contents.add(_buildRow(message, iWidth));
      contents.add(SizedBox(
        height: 12,
      ));
    }
    return contents;
  }

  _buildRow(Message message, double iWidth) {
    final TextStyle textStyle = widget.isDarkMode
        ? TextStyle(fontSize: 15, color: Colors.black)
        : TextStyle(fontSize: 15);
    Row row = message.isSelf
        ? Row(
            mainAxisAlignment: MainAxisAlignment.end,
            verticalDirection: VerticalDirection.up,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              // BubbleWidget(
              //           255.0,
              //           60,
              //           Color.fromRGBO(160, 231, 90, 1),
              //           BubbleArrowDirection.right,
              //           child: Text('你好，我是萌新 BubbleWidget！',
              //               style: TextStyle(
              //                   color: Colors.white, fontSize: 16.0),),),
              FLBubble(
                  from: FLBubbleFrom.right,
                  backgroundColor: Color.fromRGBO(160, 231, 90, 1),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: iWidth),
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    child: Text(message.text, style: textStyle, softWrap: true),
                  )),
              FLImage(
                borderRadius: BorderRadius.circular(5),
                image: AssetImage(widget.selfImageUrl),
                width: 45,
                height: 45,
                fit: BoxFit.fill,
                //onPressed: (){},
              ),
              SizedBox(
                width: 12,
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                width: 12,
              ),
              FLImage(
                borderRadius: BorderRadius.circular(5),
                image: AssetImage(widget.someImageUrl),
                width: 45,
                height: 45,
                fit: BoxFit.fill,
                //onPressed: (){},
              ),
              FLBubble(
                  from: FLBubbleFrom.left,
                  backgroundColor: Colors.white,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: iWidth),
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    child: Text(message.text, style: textStyle, softWrap: true),
                  ))
            ],
          );
//return row;
    return InkWell(
      child: row,
      onTap: widget.itemCallBack,
    );
  }
}
