import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pe_app/core/route/routes.dart';
import 'package:pe_app/view/components/hall/sycell.dart';

class BalancePage extends StatefulWidget {
  @override
  _BalancePageState createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("余额"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Theme.of(context).appBarTheme.color,
            padding: EdgeInsets.only(left: 30, top: 10, bottom: 0),
            child: Text(
              "余额(元)",
              style: TextStyle(fontSize: 15, color: Colors.grey[500]),
            ),
          ),
          Container(
            color: Theme.of(context).appBarTheme.color,
            padding: EdgeInsets.only(left: 30, top: 10, bottom: 20),
            child: Text(
              "0.00",
              style: TextStyle(fontSize: 40,fontWeight: FontWeight.w400),
            ),
          ),
          Divider(height: 1),
          SyCell(
            icon: Icon(FontAwesome.sign_in,size: 20,color: Colors.blue[600],),
            title: "充值",
            endIcon: Icon(
              CupertinoIcons.right_chevron,
              size: 20,
            ),
            isShowLine: true,
            onTap: () {
              Routes.router.navigateTo(context, Routes.mineIndexRecharge,
                  clearStack: false, transition: TransitionType.cupertino);
            },
          ),
          SyCell(
            icon: Icon(FontAwesome.sign_out,size: 20,color: Colors.yellow[800],),
            title: "提现",
            endIcon: Icon(
              CupertinoIcons.right_chevron,
              size: 20,
            ),
            isShowLine: true,
            onTap: () {
              Routes.router.navigateTo(context, Routes.mineIndexBalance,
                  clearStack: false, transition: TransitionType.cupertino);
            },
          ),
          SizedBox(
            height: 10,
          ),
          Divider(height: 1),
          SyCell(
            icon: Icon(Icons.list,size: 20,),
            title: "明细",
            endIcon: Icon(
              CupertinoIcons.right_chevron,
              size: 20,
            ),
            isShowLine: true,
            onTap: () {
              Routes.router.navigateTo(context, Routes.mineIndexBalance,
                  clearStack: false, transition: TransitionType.cupertino);
            },
          ),
        ],
      ),
    );
  }
}
