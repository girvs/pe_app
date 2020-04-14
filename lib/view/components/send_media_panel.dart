import 'package:flutter/material.dart';

class SendMediaPanelPage extends StatefulWidget {
  @override
  _SendMediaPanelPageState createState() => _SendMediaPanelPageState();
}

class _SendMediaPanelPageState extends State<SendMediaPanelPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      //水平子Widget之间间距
      crossAxisSpacing: 10.0,
      //垂直子Widget之间间距
      mainAxisSpacing: 60.0,
      //GridView内边距
      padding: EdgeInsets.all(20.0),
      //一行的Widget数量
      crossAxisCount: 4,
      //子Widget列表
      children: _getWidgetList(),
    );
  }

  _getWidgetList() {
    List<Widget> ws = [
      Column(
        children: <Widget>[
          InkWell(
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 1), //边框
                borderRadius: BorderRadius.all(
                  //圆角
                  Radius.circular(8.0),
                ),
              ),
              child: Icon(Icons.perm_media),
            ),
          ),
          Center(
            child: Text("照片"),
          )
        ],
      ),
      Column(
        children: <Widget>[
          InkWell(
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 1), //边框
                borderRadius: BorderRadius.all(
                  //圆角
                  Radius.circular(8.0),
                ),
              ),
              child: Icon(Icons.camera_enhance),
            ),
          ),
          Center(
            child: Text("相机"),
          )
        ],
      ),
      Column(
        children: <Widget>[
          InkWell(
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 1), //边框
                borderRadius: BorderRadius.all(
                  //圆角
                  Radius.circular(8.0),
                ),
              ),
              child: Icon(Icons.videocam),
            ),
          ),
          Center(
            child: Text("视频通话"),
          )
        ],
      ),
    ];
    return ws;
  }
}
