import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pe_app/core/route/routes.dart';
import 'package:pe_app/style/theme.dart';
import 'package:toast/toast.dart';

class WelComePage extends StatefulWidget {
  @override
  _WelComePageState createState() => _WelComePageState();
}

class _WelComePageState extends State<WelComePage> {
  bool _pingSuccess = true;
  int second_index = 5;
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (sd) {
      setState(() {
        second_index -= 1;
        if (this.second_index == 0) {
          second_index = 5;
          _nextPage();
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   // Constants.isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          Center(
            child: Image.asset(
              'assets/images/welcome.png',
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        width: 50,
        height: 50,
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.all(0),
        decoration: new BoxDecoration(
          color: Color(0xFF00BCD4),
          border: new Border.all(width: 1.0, color: Colors.black12),
          borderRadius: new BorderRadius.all(new Radius.circular(100)),
        ),
        child: FlatButton(
          padding: EdgeInsets.all(0),
          child: Text(
            '跳过' + (this.second_index == 0 ? '' : this.second_index.toString()),
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12),
          ),
          onPressed: () {
            _nextPage();
          },
        ),
      ),
    );
  }

  _nextPage() {
    if (!_pingSuccess) {
      Toast.show('环境异常，请检查你的网络环境！', context);
    } else {
      timer.cancel();
      Routes.router.navigateTo(context, Routes.loginPage, clearStack: true);
    }
  }
}
