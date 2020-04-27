import 'package:flui/flui.dart';
import 'package:flutter/material.dart';

class ChatVideoCallPage extends StatefulWidget {
  final String selfUserId;
  final String callUserId;

  const ChatVideoCallPage(this.selfUserId, this.callUserId, {Key key})
      : super(key: key);
  @override
  _ChatVideoCallPageState createState() => _ChatVideoCallPageState();
}

class _ChatVideoCallPageState extends State<ChatVideoCallPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FLAvatar(
              image: Image.asset(
                'assets/girl/1.jpg',
                scale: 2,
                fit: BoxFit.fill,
                width: 75,
                height: 75,
              ),
              width: 75,
              height: 75,
              radius: 10, // if not specify, will be width / 2
            ),
            Text(
              "宝贝很乖",
              style: TextStyle(fontSize: 14),
            ),
            Text(
              "正在准备和你进行通话....",
              style: TextStyle(fontSize: 12, color: Colors.white24),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 2 - 90),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.call,
                  size: 60,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 100,
                ),
                Icon(
                  Icons.healing,
                  color: Colors.white,
                  size: 60,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
