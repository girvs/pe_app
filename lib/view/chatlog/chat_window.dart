import 'package:flutter/material.dart';
import 'package:pe_app/view/components/chatlog/message_item.dart';
import 'package:pe_app/view/components/icon_word_button.dart';

class ChatWindowPage extends StatefulWidget {
  @override
  _ChatWindowPageState createState() => _ChatWindowPageState();
}

class _ChatWindowPageState extends State<ChatWindowPage> {
  List<Message> messages = [
    Message("还没有起来了没有了？还没有起来了没有了？还没有起来了没有了？还没有起来了没有了？", false, DateTime.now()),
    Message("还没有起来了没有了？", false, DateTime.now()),
    Message("还没有起来了没有了？", false, DateTime.now()),
    Message("还没有起来了没有了？", false, DateTime.now()),
    Message(
        "还没有起来了没有了？还没有起来了没有了？还没有起来了没有了？还没有起来了没有了？还没有起来了没有了？还没有起来了没有了？还没有起来了没有了？还没有起来了没有了？还没有起来了没有了？还没有起来了没有了？还没有起来了没有了？还没有起来了没有了？还没有起来了没有了？还没有起来了没有了？还没有起来了没有了？还没有起来了没有了？还没有起来了没有了？还没有起来了没有了？还没有起来了没有了？还没有起来了没有了？还没有起来了没有了？还没有起来了没有了？还没有起来了没有了？还没有起来了没有了？还没有起来了没有了？",
        true,
        DateTime.now()),
    Message("还没有起来了没有了？", false, DateTime.now()),
    Message("还没有起来了没有了？", false, DateTime.now()),
    Message("还没有起来了没有了？", false, DateTime.now()),
    Message("还没有起来了没有了？", false, DateTime.now()),
  ];

  bool isShowPanel = false;

  @override
  void initState() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        isShowPanel = false;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    final double width = queryData.size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("张三"),
        centerTitle: true,
        //backgroundColor: Colors.black38,
      ),
      //backgroundColor: Colors.red,
      body: new Column(
        children: <Widget>[
          new Flexible(
            child: MessageItem(
              messages: messages,
              isDarkMode: _isDarkMode,
              iWidth: width - 150,
              selfImageUrl: "assets/images/welcome.png",
              someImageUrl: "assets/images/welcome.png",
              itemCallBack: _hideKeyBoardAndPanel,
            ),
          ),
          _buildButtom(),
          _buildActionPanel(),
          SizedBox(height: 10,)
        ],
      ),
    );
  }

  bool get _isDarkMode {
    return Theme.of(context).brightness == Brightness.dark;
  }

  FocusNode _focusNode = FocusNode();
  _hideKeyBoardAndPanel() {
    isShowPanel = false;
    print(1);
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {});
  }

  _showPanel() {
    isShowPanel = !isShowPanel;
    print(isShowPanel);
    if (isShowPanel) {
      FocusScope.of(context).requestFocus(FocusNode());
    }
    setState(() {});
  }

  Widget _buildButtom() {
    return Container(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 0.0, left: 0.0),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Colors.black12),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //verticalDirection: VerticalDirection.up,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  focusNode: _focusNode,
                  autofocus: false,
                  initialValue: '',
                  decoration: InputDecoration(
                    hintText: '请输入消息',
                    contentPadding: EdgeInsets.fromLTRB(15.0, -5.0, 5.0, -5.0),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
              ),
              Container(
                //margin: EdgeInsets.only(bottom:10),
                height: 50,
                child: IconButton(
                  icon: Icon(
                    isShowPanel
                        ? Icons.remove_circle_outline
                        : Icons.add_circle_outline,
                    size: 35,
                  ),
                  onPressed: _showPanel,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildActionPanel() {
    return isShowPanel
        ? Container(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            margin: EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _getWidgetList(),
            ),
          )
        : Container(
            margin: EdgeInsets.only(bottom: 8),
          );
  }

  _getWidgetList() {
    List<Widget> ws = [
      IconWordButton(
        text: "照片",
        icon: Icon(
          Icons.perm_media,
          size: 32,
        ),
        func: () {},
      ),
      IconWordButton(
        text: "相机",
        icon: Icon(
          Icons.camera_enhance,
          size: 32,
        ),
        func: () {},
      ),
      IconWordButton(
        text: "视频通话",
        icon: Icon(
          Icons.videocam,
          size: 32,
        ),
        func: () {},
      ),
      SizedBox(
        width: 50,
      )
    ];
    return ws;
  }
}
