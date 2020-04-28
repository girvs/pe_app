import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pe_app/core/route/routes.dart';

class ChatVideoCallPage extends StatefulWidget {
  final String selfUserId;
  final String callUserId;

  const ChatVideoCallPage(this.selfUserId, this.callUserId, {Key key})
      : super(key: key);
  @override
  _ChatVideoCallPageState createState() => _ChatVideoCallPageState();
}

class _ChatVideoCallPageState extends State<ChatVideoCallPage> {
  bool selfOrCalling = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black,
          ),
          Positioned(
            top: 120,
            left: MediaQuery.of(context).size.width / 2 - 80,
            child: Container(
              width: 160,
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
                  SizedBox(height: 10),
                  Text(
                    "宝贝很乖",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  Text(
                    "邀请您进行视频通话....",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 35,
            left: MediaQuery.of(context).size.width / 6,
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: buildItemBtns(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildItemBtns() {
    List<Widget> items = [];
    if (!selfOrCalling) {
      items.add(builditemBtn(Icons.call, "接受", Colors.green, () {
        selfOrCalling = true;
        setState(() {});
      }));
      items.add(SizedBox(width: MediaQuery.of(context).size.width / 3 - 35));
    }
    items.add(builditemBtn(Icons.call_end, "挂断", Colors.red, () {
      Routes.router.pop(context);
    }));
    return items;
  }

  Widget builditemBtn(IconData icon, String title, Color backgroundColor,
      VoidCallback callback) {
    return InkWell(
      onTap: callback,
      child: Column(
        children: <Widget>[
          CircleAvatar(
            //头像半径
            radius: 35,
            child: Icon(
              icon,
              size: 35,
            ),
            backgroundColor: backgroundColor,
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
