import 'package:flui/flui.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:pe_app/core/route/routes.dart';

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
          // leading: Center(
          //   child: FLBadge(
          //     child: FLAvatar(
          //       image: Image.asset(
          //         'assets/images/welcome.png',
          //         scale: 2,
          //         fit: BoxFit.fill,
          //         width: 50,
          //         height: 50,
          //       ),
          //       width: 45,
          //       height: 45,
          //       radius: 50, // if not specify, will be width / 2
          //     ),
          //     hidden: false,
          //     position: FLBadgePosition.bottomRight, // default is topRight
          //     shape: FLBadgeShape.circle,
          //     color: Colors.grey,
          //   ),
          // ),
          pinned: true,
          title: Text('消息'),
          centerTitle: true,
          // flexibleSpace: Container(
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(colors: [
          //       Color(0xFF0018EB),
          //       Color(0xFF01C1D9),
          //     ], begin: Alignment.centerLeft, end: Alignment.centerRight),
          //   ),
          // ),
          // actions: <Widget>[
          //   Icon(Icons.search),
          // ],
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
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      decoration: BoxDecoration(
      color: Theme.of(context).appBarTheme.color,

        //border: Border.all(width: 0.5, color: Colors.black12),
        //color: Theme.of(context).primaryColor,
      ),
      child: OutlineButton.icon(
        color: Theme.of(context).textSelectionColor,
        onPressed: null,
        icon: Icon(
          Icons.search,
          size: 18,
        ),
        label: Text("搜索"),
      ),
    );
  }

  ListTile _buildRow(String sender, String text, String headerImageUrl) {
    return ListTile(
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
        ));
  }

  _nextWindowPage() {
    Routes.router.navigateTo(
      context,
      Routes.chatWindowPage,
      clearStack: false,
      transition: TransitionType.inFromRight,
    );
  }
}
