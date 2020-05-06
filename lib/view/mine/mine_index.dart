import 'package:flui/flui.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pe_app/core/route/routes.dart';
import 'package:pe_app/style/theme.dart';
import 'package:pe_app/view/components/hall/sycell.dart';
import 'package:pe_app/view/components/mine/user_icon.dart';

class MineIndexPage extends StatefulWidget {
  @override
  _MineIndexPageState createState() => _MineIndexPageState();
}

class _MineIndexPageState extends State<MineIndexPage> {
  @override
  Widget build(BuildContext context) {
    // 头像组件
    Widget userImage = new UserIcon(
      padding: const EdgeInsets.only(top: 28.0, right: 18.0, left: 25.0),
      width: 55.0,
      height: 55.0,
      image: 'assets/images/welcome.png',
      isNetwork: false,
      onPressed: () {
        // NavigatorUtils.goPerson(context, eventViewModel.actionUser);
      },
    );

    var scaffoldBody = Scaffold(
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              Container(
                color: Constants.getCurrenThemeContainerColor(Theme.of(context).brightness),
                height: 180.0,
                child: RawMaterialButton(
                  onPressed: () {
                    Routes.router.navigateTo(context, Routes.mineIndexMySetting,
                        clearStack: false,
                        transition: TransitionType.cupertino);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      userImage,
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(top: 83.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'leeo',
                                style: TextStyle(
                                    fontSize: 22.5,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: 2.0,
                              ),
                              Text(
                                '微信号：zwleee',
                                maxLines: 1,
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 13.0),
                              )
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                                top: 65.0, bottom: 15.0, right: 10.0),
                            child: Icon(
                              FontAwesome.qrcode,
                              //ICons.QR,
                              color: Colors.grey,
                              size: 15.0,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                top: 65.0, bottom: 15.0, right: 10.0),
                            child: Icon(
                              CupertinoIcons.right_chevron,
                              size: 20,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Divider(height: 1),
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    Divider(height: 1),
                    SyCell(
                      icon: Icon(
                        AntDesign.pay_circle_o1,
                        size: 20,
                        color: Color.fromARGB(255, 255, 215, 0),
                      ),
                      title: "余额",
                      endIcon: Icon(
                        CupertinoIcons.right_chevron,
                        size: 20,
                      ),
                      isShowLine: true,
                      onTap: () {
                        Routes.router.navigateTo(
                            context, Routes.mineIndexBalance,
                            clearStack: false,
                            transition: TransitionType.cupertino);
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(height: 1),
                    SyCell(
                      icon: Icon(
                        AntDesign.picture,
                        size: 20,
                        color: Color.fromARGB(255, 64, 224, 208),
                      ),
                      title: "我的相册",
                      endIcon: Icon(
                        CupertinoIcons.right_chevron,
                        size: 20,
                      ),
                      isShowLine: true,
                      onTap: () {},
                    ),
                    //SizedBox(height: 15,),
                    SyCell(
                      icon: Icon(
                        AntDesign.videocamera,
                        size: 20,
                        color: Color.fromARGB(255, 135, 206, 235),
                      ),
                      title: "视频设置",
                      endIcon: Icon(
                        CupertinoIcons.right_chevron,
                        size: 20,
                      ),
                      isShowLine: true,
                      onTap: () {
                        Routes.router.navigateTo(
                            context, Routes.mineIndexVideoSetting,
                            clearStack: false,
                            transition: TransitionType.cupertino);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return scaffoldBody;
  }
}
