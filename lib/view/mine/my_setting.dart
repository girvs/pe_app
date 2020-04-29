import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pe_app/style/theme.dart';
import 'package:pe_app/view/components/space_size_box.dart';

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
        color: Constants.containerColor, //Color.fromRGBO(246, 246, 246, 1),
        child: ListView(
          children: <Widget>[
            SpaceSizeBox(
              height: 10,
            ),
            Divider(height: 1),
            CententItemWidget(
              title: "头像",
              text: Image.asset('assets/girl/1.jpg',
                  width: 40, height: 40, fit: BoxFit.fill),
              icon: Icon(
                AntDesign.right,
                size: 18,
              ),
            ),
            CententItemWidget(
              title: "昵称",
              text: Text("kicck"),
              icon: Icon(
                AntDesign.right,
                size: 18,
              ),
            ),
            CententItemWidget(
              title: "性别",
              text: Text("男"),
              //icon: Icon(AntDesign.right,size: 18,),
            ),
            CententItemWidget(
              title: "年龄",
              text: Text("22"),
              icon: Icon(
                AntDesign.right,
                size: 18,
              ),
            ),
            CententItemWidget(
              title: "注册时间",
              text: Text("2020-09-09"),
            ),
            CententItemWidget(
              title: "我的二维码",
              text: Icon(AntDesign.qrcode),
              icon: Icon(
                AntDesign.right,
                size: 18,
              ),
            ),
            SpaceSizeBox(height: 300),
          ],
        ),
      ),
    );
  }
}

class CententItemWidget extends StatelessWidget {
  final String title;
  final Widget text;
  final Icon icon;
  final VoidCallback callback;

  const CententItemWidget(
      {Key key, this.title, this.text, this.icon, this.callback})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          height: 45,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(title),
              Row(
                children: <Widget>[
                  text,
                  SizedBox(
                    width: 10,
                  ),
                  icon ?? SizedBox(width: 1),
                ],
              ),
            ],
          ),
        ),
        Divider(height: 1),
      ],
    );
  }
}
