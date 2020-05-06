import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pe_app/style/theme.dart';
import 'package:pe_app/view/addressbook/attention_list.dart';
import 'package:pe_app/view/addressbook/my_friend_list.dart';

class AddressBookIndexPage extends StatefulWidget {
  @override
  _AddressBookIndexPageState createState() => _AddressBookIndexPageState();
}

class _AddressBookIndexPageState extends State<AddressBookIndexPage> {
  @override
  void initState() {
    super.initState();
  }

  String _fruit = '好友列表';
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    print(isDark);
    return Scaffold(
      appBar: AppBar(
        title: Text("通讯录"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(18),
            color: Theme.of(context).appBarTheme.color,
            child: CupertinoSegmentedControl(
              unselectedColor: isDark ? Colors.white : Colors.black,
              selectedColor: isDark ? Colors.black : Colors.white,
              borderColor: isDark ? Colors.white : Colors.black,
              children: {
                '好友列表': Text('好友列表'),
                '关注列表': Text('关注列表'),
              }, // 数据
              groupValue: _fruit, // 选中的数据
              onValueChanged: (fruit) {
                setState(() {
                  _fruit = fruit;
                });
              },
            ),
          ),
          Divider(height: 1),
          Expanded(
            child: _fruit == '好友列表' ? MyFriendListPage() : AttentionPage(),
          ),
        ],
      ),
    );
  }
}
