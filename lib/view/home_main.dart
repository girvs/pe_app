import 'package:flutter/material.dart';
import 'package:pe_app/view/chatlog/chat_log_index.dart';

import 'components/bottom_navigation_bar.dart';

class HomeMainPage extends StatefulWidget {
  @override
  _HomeMainPageState createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> {
  Widget currentPage = new ChatLogIndexPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage,
      bottomNavigationBar: BottomNavigationBarDefault(refreshPage),
    );
  }

  void refreshPage(Widget value) {
    setState(() {
      currentPage = value;
    });
  }
}
