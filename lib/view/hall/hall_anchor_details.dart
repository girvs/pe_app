import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pe_app/style/theme.dart';
import 'package:pe_app/view/components/hall/SliverCustomHeaderDelegate.dart';
import 'package:pe_app/view/components/photo_vew.dart';
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
                  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1587113164699&di=2d15b0c37d8433adc48277cb53d9fce1&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201802%2F24%2F20180224130717_J5knA.jpeg',
              leftBtn: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
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
  List<String> images = [
    "http://b-ssl.duitang.com/uploads/item/201608/27/20160827172726_GJfX2.jpeg",
    "http://5b0988e595225.cdn.sohucs.com/images/20181003/0f8307fe3de6468d8b51c53b276e9e1b.jpeg",
    "http://up.svwsy.com/uploads/allimg/aebiauqrqdb.jpg",
    "http://ztd00.photos.bdimg.com/ztd/w=700;q=50/sign=eefb9ac172899e51788e3814729ca80e/3b87e950352ac65ccb392f4ff2f2b21193138aca.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 10, left: 10, bottom: 10),
          color: Constants.containerColor,
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
                  "2245人",
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
                    size: 0,
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
          height: 1,
        ),
        Container(
          padding: EdgeInsets.only(top: 15, bottom: 15, left: 15),
          color: Constants.containerColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
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
        ),
        Container(
          padding: EdgeInsets.only(left: 20, top: 0),
          alignment: Alignment.centerLeft,
          color: Constants.containerColor,
          child: Text(
            "简介",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20, top: 10, bottom: 15),
          alignment: Alignment.centerLeft,
          color: Constants.containerColor,
          child: Text(
            "    跟我走吧，忐忑给你，情书给你，不眠的夜给你，四月的清晨给你，雪糕的第一口给你，海底捞的最后一颗鱼丸给你，手给你，怀抱给你，车票给你，跋涉给你，等待给你，钥匙给你，家给你，一腔孤勇和余生六十年，都给你。",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        SpaceSizeBox(
          height: 20,
        ),
        Container(
          color: Constants.containerColor,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: InkWell(
            onTap: () {
              //FadeRoute是自定义的切换过度动画（渐隐渐现） 如果不需要 可以使用默认的MaterialPageRoute
              Navigator.of(context).push(new FadeRoute(
                  page: PhotoViewPage(
                images: images, //传入图片list
                index: 0, //传入当前点击的图片的index
                heroTag: '', //传入当前点击的图片的hero tag （可选）
              )));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text("照片"),
                  margin: EdgeInsets.all(10),
                ),
                SizedBox(
                  width: 5,
                ),
                Image.network(
                    "http://b-ssl.duitang.com/uploads/item/201608/27/20160827172726_GJfX2.jpeg",
                    width: 50,
                    height: 50,
                    fit: BoxFit.fill),
                SizedBox(
                  width: 5,
                ),
                Image.network(
                    "http://5b0988e595225.cdn.sohucs.com/images/20181003/0f8307fe3de6468d8b51c53b276e9e1b.jpeg",
                    width: 50,
                    height: 50,
                    fit: BoxFit.fill),
                SizedBox(
                  width: 5,
                ),
                Image.network(
                    "http://up.svwsy.com/uploads/allimg/aebiauqrqdb.jpg",
                    width: 50,
                    height: 50,
                    fit: BoxFit.fill),
                SizedBox(
                  width: 5,
                ),
                Image.network(
                    "http://ztd00.photos.bdimg.com/ztd/w=700;q=50/sign=eefb9ac172899e51788e3814729ca80e/3b87e950352ac65ccb392f4ff2f2b21193138aca.jpg",
                    width: 50,
                    height: 50,
                    fit: BoxFit.fill),
              ],
            ),
          ),
        ),
        SpaceSizeBox(
          height: 20,
        ),
        Divider(height: 1),
        InkWell(
          child: Container(
            color: Constants.containerColor,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(CupertinoIcons.conversation_bubble),
                Text("发送消息")
              ],
            ),
          ),
        ),
        Divider(height: 1),
        InkWell(
          child: Container(
            color: Constants.containerColor,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(CupertinoIcons.video_camera),
                Text("视频聊天")
              ],
            ),
          ),
        ),
        Divider(
          height: 1,
        ),
        SpaceSizeBox(
          height: 200,
        ),
      ],
    );
  }
}
