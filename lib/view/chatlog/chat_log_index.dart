import 'package:flui/flui.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:pe_app/core/route/routes.dart';
import 'package:pe_app/style/theme.dart';
import 'package:pe_app/view/components/pe_container.dart';

class ChatLogIndexPage extends StatefulWidget {
  @override
  _ChatLogIndexPageState createState() => _ChatLogIndexPageState();
}

class _ChatLogIndexPageState extends State<ChatLogIndexPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          title: Text('消息'),
          centerTitle: true,
          elevation: 0.0,
        ),
        SliverList(
          delegate: SliverChildListDelegate(_buildChatList()),
        ),
      ],
    );
  }

  List<Widget> _buildChatList() {
    List<Widget> chatList = [];
    chatList.add(_buildSearchList());
    chatList.add(Divider(
      height: 1,
    ));
    chatList.add(FLNoticeBar.notice(
      text: '暂时无法联接到网络，请检查你的网络！',
      velocity: 0.6,
    ));
    chatList.add(Divider(
      height: 1,
    ));
    for (var i = 0; i < 15; i++) {
      chatList
          .add(_buildRow('张三', '[2条]早上好啊，好久不见了！', 'assets/images/welcome.png'));
      chatList.add(Divider(
        height: 1,
      ));
    }
    return chatList;
  }

  Widget _buildSearchList() {
    final txtAlipayName = ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 40, maxWidth: 200),
      child: TextFormField(
        autovalidate: true,
        keyboardType: TextInputType.text,
        autofocus: false,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: '搜索',
          contentPadding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.color,
      ),
      child: txtAlipayName,
    );
  }

  Widget _buildRow(String sender, String text, String headerImageUrl) {
    var listTitleWidget = ListTile(
      onTap: _nextWindowPage,
      selected: false,
      dense: true,
      leading: FLBadge(
        child: FLImage(
          borderRadius: BorderRadius.circular(5),
          image: AssetImage('assets/girl/1.jpg'),
          width: 45,
          height: 45,
          fit: BoxFit.fill,
          //onPressed: (){},
        ),
        position: FLBadgePosition.bottomRight,
        color: Colors.greenAccent,
      ),
      title: Text(
        "王府井",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      subtitle: Text("[2条]早上好啊，好久不见了！"),
      trailing: Column(
        verticalDirection: VerticalDirection.down,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            DateTime.now().hour.toString() +
                ":" +
                DateTime.now().minute.toString(),
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(
            height: 10,
          ),
          Icon(Icons.notifications, size: 16)
        ],
      ),
    );
    return PeContainer(
      //color: Constants.containerColor,
      child: listTitleWidget,
    );
  }

  _nextWindowPage() {
    Routes.router.navigateTo(
      context,
      Routes.chatWindowPage,
      clearStack: false,
      transition: TransitionType.cupertino,
    );
  }
}
