import 'dart:async';
import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import 'package:pe_app/style/theme.dart';

class Message {
  String text;
  bool isSelf;
  DateTime chatTime;

  Message(this.text, this.isSelf, this.chatTime);
}

class MessageItem extends StatefulWidget {
  final List<Message> messages;
  final double iWidth;
  final String selfImageUrl;
  final String someImageUrl;
  final GestureTapCallback itemCallBack;
  const MessageItem(
      {Key key,
      this.messages,
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
                    child: Text(message.text,
                        style: TextStyle(fontSize: 15, color: Colors.black),
                        softWrap: true),
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
                  backgroundColor: Constants.isDark
                      ? Constants.containerColor
                      : Colors.white,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: iWidth),
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    child: Text(message.text,
                        style: TextStyle(
                            fontSize: 15,
                            color:
                                Constants.isDark ? Colors.white : Colors.black),
                        softWrap: true),
                  ))
            ],
          );
//return row;
    return InkWell(
      child: row,
      //onTap: widget.itemCallBack,
    );
  }
}
