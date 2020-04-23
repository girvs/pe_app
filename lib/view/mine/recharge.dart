import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pe_app/view/components/hall/sycell.dart';
import 'package:pe_app/view/components/space_size_box.dart';

class RechargePage extends StatefulWidget {
  @override
  _RechargePageState createState() => _RechargePageState();
}

class _RechargePageState extends State<RechargePage> {
  var selectIndex = 0;
  List<int> payList = [6, 50, 100, 600, 1200];
  var selectPay = 0;

  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    var selectColor = isDark ? Colors.white : Colors.yellow[900];
    return Scaffold(
      appBar: AppBar(
        title: Text("充值"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 30, bottom: 20,top:20),
            color: Theme.of(context).appBarTheme.color,
            child: Row(
              children: <Widget>[
                FLAvatar(
                  image: Image.asset(
                    'assets/images/welcome.png',
                    scale: 2,
                    width: 50,
                    height: 50,
                    fit: BoxFit.fill,
                  ),
                  width: 50,
                  height: 50,
                  radius: 50, // if not specify, will be width / 2
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 18),
                      child: Text(
                        "alibaba",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 18),
                      child: Text(
                        "账户余额：0.00",
                        style: TextStyle(fontSize: 13),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Divider(height: 1),
          Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(top: 18, bottom: 0, left: 20),
            child: Text("选择充值数量"),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.all(20),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 30,
                crossAxisSpacing: 30,
                childAspectRatio: 1.4,
              ),
              itemCount: payList.length,
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectIndex = index;
                        });
                      },
                      child: Container(
                        alignment: Alignment(0, 0),
                        decoration: BoxDecoration(
                          //color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(2.0)),
                          border: new Border.all(
                              width: 1,
                              color: index == selectIndex
                                  ? selectColor
                                  : Theme.of(context).appBarTheme.color),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "￥" + payList[index].toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: -1,
                      bottom: -1,
                      child: index == selectIndex
                          ? Icon(
                              Icons.signal_cellular_4_bar,
                              size: 16,
                              color: selectColor,
                            )
                          : Container(),
                    ),
                  ],
                );
              },
            ),
          ),
          SpaceSizeBox(height: 10),
          Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(top: 18, bottom: 0, left: 20),
            child: Text("选择支付方式"),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(top: 18, bottom: 18),
            child: Column(
              children: <Widget>[
                Divider(
                  height: 1,
                ),
                SyCell(
                  isShowLine: true,
                  icon: Icon(
                    FontAwesome.wechat,
                    color: Colors.green,
                  ),
                  title: "微信",
                  endIcon: Icon(
                    Icons.check_circle_outline,
                    size: 16,
                    color: selectPay == 0
                        ? selectColor
                        : Theme.of(context).dividerColor,
                  ),
                  onTap: () {
                    setState(() {
                      selectPay = 0;
                    });
                  },
                ),
                SyCell(
                  isShowLine: true,
                  icon: Icon(
                    AntDesign.alipay_square,
                    color: Colors.blue,
                  ),
                  title: "支付宝",
                  endIcon: Icon(
                    Icons.check_circle_outline,
                    size: 16,
                    color: selectPay == 1
                        ? selectColor
                        : Theme.of(context).dividerColor,
                  ),
                  onTap: () {
                    setState(() {
                      selectPay = 1;
                    });
                  },
                ),
                Container(
                  padding: EdgeInsets.only(left: 20, top: 8),
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      text: '应付 ',
                      style: TextStyle(
                          fontSize: 12.0,
                          color: Theme.of(context).textTheme.title.color),
                      children: <TextSpan>[
                        TextSpan(
                            text: payList[selectIndex].toString(),
                            style: TextStyle(color: selectColor, fontSize: 18)),
                        TextSpan(
                          text: ' 元',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 1,
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: isDark ? Theme.of(context).primaryColor : selectColor,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment(0, 0),
          height: 50,
          child: Text(
            "立即充值",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
          ),
        ),
      ),
    );
  }
}
