import 'package:flutter/material.dart';

class MySettingPage extends StatefulWidget {
  @override
  _MySettingPageState createState() => _MySettingPageState();
}

class _MySettingPageState extends State<MySettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("个人信息"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white, //Color.fromRGBO(246, 246, 246, 1),
        child: ListView(
          children: <Widget>[
            ListTile(
              selected: false,
              title: Text("名称"),
              trailing: Row(
                children: <Widget>[
                  Text("kicck"),
                  //Icon(Icons.arrow_right),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
