import 'dart:async';

import 'package:flui/flui.dart';
import 'package:flutter/material.dart';

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
              FLBubble(
                  from: FLBubbleFrom.right,
                  backgroundColor: Color.fromRGBO(160, 231, 90, 1),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: iWidth),
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    child: Text(message.text, style: textStyle, softWrap: true),
                  )),
              FLAvatar(
                image: Image.asset(
                  widget.selfImageUrl,
                  scale: 2,
                  fit: BoxFit.fill,
                  width: 50,
                  height: 50,
                ),
                width: 50,
                height: 50,
                radius: 5, // if not specify, will be width / 2
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
              FLAvatar(
                image: Image.asset(
                  widget.someImageUrl,
                  scale: 2,
                  fit: BoxFit.fill,
                  width: 50,
                  height: 50,
                ),
                width: 50,
                height: 50,
                radius: 5, // if not specify, will be width / 2
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
