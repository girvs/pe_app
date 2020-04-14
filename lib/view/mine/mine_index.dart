import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import 'package:pe_app/view/components/icon_word_button.dart';

class MineIndexPage extends StatefulWidget {
  @override
  _MineIndexPageState createState() => _MineIndexPageState();
}

class _MineIndexPageState extends State<MineIndexPage> {
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
      IconWordButton(
        text: "照片",
        icon: Icon(Icons.perm_media),
        func: (){},
      ),
      IconWordButton(
        text: "相机",
        icon: Icon(Icons.camera_enhance),
        func: (){},
      ),
      IconWordButton(
        text: "视频通话",
        icon: Icon(Icons.videocam),
        func: (){},
      ),
    ];
    return ws;
  }
}
