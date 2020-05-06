import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pe_app/view/addressbook/addressbookIndex.dart';
import 'package:pe_app/view/hall/hall_indexAll.dart';

import '../chatlog/chat_log_index.dart';
import '../hall/hall_index.dart';
import '../mine/mine_index.dart';

class BottomNavigationBarDefault extends StatefulWidget {
  final ValueChanged<Widget> currentPage;
  BottomNavigationBarDefault(this.currentPage, {Key key}) : super(key: key);
  @override
  _BottomNavigationBarDefaultState createState() =>
      _BottomNavigationBarDefaultState();
}

class _BottomNavigationBarDefaultState
    extends State<BottomNavigationBarDefault> {
  int currentTab = 0;
  ChatLogIndexPage chatLogIndexPage = new ChatLogIndexPage();
  //AddressBookIndexPage addressBookIndexPage = new AddressBookIndexPage();
  HallIndexAllPage hallIndexPage = new HallIndexAllPage();
  MineIndexPage mineIndexPage = new MineIndexPage();

  List<Widget> pages;
  Widget currentPage;

  @override
  void initState() {
    super.initState();
    pages = [
      chatLogIndexPage,
      //addressBookIndexPage,
      hallIndexPage,
      mineIndexPage,
    ];
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).bottomAppBarColor,
      type: BottomNavigationBarType.fixed,
      // backgroundColor: Colors.white70,
      selectedItemColor: Colors.blueAccent,
      // unselectedItemColor: isDark ? Colors.white : Colors.black,
      iconSize: 24,
      currentIndex: currentTab,
      onTap: (int numTab) {
        currentTab = numTab;
        widget.currentPage(pages[numTab]);
      },
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
            //numTab 1
            icon: new Icon(CupertinoIcons.conversation_bubble),
            title: new Text("聊天")),
        // new BottomNavigationBarItem(
        //     //numTab 2
        //     icon: new Icon(AntDesign.team),
        //     title: new Text("通讯录")),
        new BottomNavigationBarItem(
            //numTab 2
            icon: new Icon(Icons.tv),
            title: new Text("大厅")),
        new BottomNavigationBarItem(
            //numTab 2
            icon: new Icon(CupertinoIcons.person),
            title: new Text("我的"))
      ],
    );
  }
}
