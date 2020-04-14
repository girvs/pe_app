import 'package:flutter/material.dart';

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
  HallIndexPage hallIndexPage = new HallIndexPage();
  MineIndexPage mineIndexPage = new MineIndexPage();

  List<Widget> pages;
  Widget currentPage;

  @override
  void initState() {
    super.initState();
    pages = [chatLogIndexPage, hallIndexPage, mineIndexPage];
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      // backgroundColor: Colors.white70,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.black,
      iconSize: 32,
      currentIndex: currentTab,
      onTap: (int numTab) {
        currentTab = numTab;
        widget.currentPage(pages[numTab]);
      },
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
            //numTab 1
            icon: new Icon(Icons.chat),
            title: new Text("聊天")),
        new BottomNavigationBarItem(
            //numTab 2
            icon: new Icon(Icons.supervisor_account),
            title: new Text("大厅")),
        new BottomNavigationBarItem(
            //numTab 2
            icon: new Icon(Icons.perm_identity),
            title: new Text("我"))
      ],
    );
  }
}