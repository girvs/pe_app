import 'package:flui/flui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pe_app/view/components/hall/SliverCustomHeaderDelegate.dart';
import 'package:pe_app/view/components/hall/cell.dart';
import 'package:pe_app/view/components/icon_word_button.dart';
import 'package:pe_app/view/components/space_size_box.dart';

class HallAnchorDetailsPage extends StatefulWidget {
  @override
  _HallAnchorDetailsPageState createState() => _HallAnchorDetailsPageState();
}

class _HallAnchorDetailsPageState extends State<HallAnchorDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverCustomHeaderDelegate(
                title: '宝贝很乖',
                collapsedHeight: 60,
                expandedHeight: MediaQuery.of(context).size.width / 16 * 9,
                paddingTop: MediaQuery.of(context).padding.top,
                coverImgUrl:
                    'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1587113164699&di=2d15b0c37d8433adc48277cb53d9fce1&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201802%2F24%2F20180224130717_J5knA.jpeg'),
          ),
          SliverToBoxAdapter(
            child: FilmContent(),
          )
        ],
      ),
    );
  }
}

class FilmContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Text(
                "宝贝很乖",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              FlatButton.icon(
                icon: Icon(
                  Icons.people,
                  size: 14,
                  color: Colors.pink,
                ),
                label: Text(
                  "2245人关注",
                  style: TextStyle(fontSize: 12),
                ),
                onPressed: null,
              ),
              FlatButton.icon(
                icon: Icon(
                  Icons.brightness_1,
                  size: 12,
                  color: Colors.green,
                ),
                label: Text(
                  "空闲状态",
                  style: TextStyle(fontSize: 10),
                ),
                onPressed: null,
              ),
              Container(
                padding: EdgeInsets.only(left: 0),
                child: FlatButton.icon(
                  icon: Icon(
                    Icons.attach_money,
                    size: 22,
                    color: Colors.green,
                  ),
                  label: Text(
                    "5￥/分钟",
                    style: TextStyle(fontSize: 14),
                  ),
                  onPressed: null,
                ),
              )
            ],
          ),
        ),
        SpaceSizeBox(
          width: MediaQuery.of(context).size.width,
          height: 0,
          margin: EdgeInsets.only(top: 0, bottom: 12),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 15),
              padding: EdgeInsets.only(left: 10, right: 10),
              alignment: Alignment(0, 0),
              height: 20,
              decoration: new BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                border: new Border.all(width: 1, color: Colors.blue),
              ),
              child: Text(
                "年龄：22岁",
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              margin: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment(0, 0),
              height: 20,
              decoration: new BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                border: new Border.all(width: 1, color: Colors.blue),
              ),
              child: Text(
                "性别：女",
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              margin: EdgeInsets.only(
                left: 10,
              ),
              alignment: Alignment(0, 0),
              height: 20,
              width: 120,
              decoration: new BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                border: new Border.all(width: 1, color: Colors.blue),
              ),
              child: Text(
                "地区：湖南省长沙市",
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.only(left: 20, top: 0),
          alignment: Alignment.centerLeft,
          child: Text(
            "简历",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, top: 10),
          alignment: Alignment.centerLeft,
          child: Text(
            "跟我走吧，忐忑给你，情书给你，不眠的夜给你，四月的清晨给你，雪糕的第一口给你，海底捞的最后一颗鱼丸给你，手给你，怀抱给你，车票给你，跋涉给你，等待给你，钥匙给你，家给你，一腔孤勇和余生六十年，都给你。",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        SpaceSizeBox(
          height: 20,
          margin: EdgeInsets.only(bottom: 10, top: 20),
        ),
        InkWell(
          child: Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 2, bottom: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(CupertinoIcons.conversation_bubble),
                Text("发送消息")
              ],
            ),
          ),
        ),
        Divider(),
        InkWell(
          child: Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 2, bottom: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(CupertinoIcons.video_camera),
                Text("视频聊天")
              ],
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
