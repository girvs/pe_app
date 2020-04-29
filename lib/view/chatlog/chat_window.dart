import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pe_app/core/route/routes.dart';
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
    Message("还没有起来了没有了？", true, DateTime.now()),
    Message("还没有起来了没有了？", false, DateTime.now()),
    Message(
        "还没有起来了没有了？还没有起来了没有了？还没来了没有还没有起来了没有了？还没有起来了没有了？", true, DateTime.now()),
    Message("还没有起来了没有了？", false, DateTime.now()),
    Message("还没有起来了没有了？", false, DateTime.now()),
    Message("还没有起来了没有了？", true, DateTime.now()),
    Message("还没有起来了没有了？", false, DateTime.now()),
  ];

  bool isShowPanel = false;
  bool isOpenKeyboard = false;

  FocusNode _focusNode = FocusNode();
  // _hideKeyBoardAndPanel() {
  //   isShowPanel = false;
  //   isOpenKeyboard = true;
  //   FocusScope.of(context).requestFocus(FocusNode());
  //   setState(() {});
  // }

  _showPanel() {
    isShowPanel = !isShowPanel;
    if (isShowPanel) {
      FocusScope.of(context).requestFocus(FocusNode());
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        isShowPanel = false;
        isOpenKeyboard = true;
      } else {
        isOpenKeyboard = false;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    final double width = queryData.size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("张三"),
        centerTitle: true,
        elevation: 0,
        bottom: PreferredSize(child: Divider(height: 1,),),
      ),
      body: new Column(
        children: <Widget>[
          new Flexible(
            child: MessageItem(
              messages: messages,
              iWidth: width - 150,
              selfImageUrl: "assets/images/welcome.png",
              someImageUrl: "assets/images/welcome.png",
              //itemCallBack: _hideKeyBoardAndPanel,
            ),
          ),
          // _buildButtom(),
          // _buildActionPanel(),
          //SizedBox(height: 10,)
        ],
      ),
      bottomNavigationBar: _buildButtomTest(),
    );
  }

  double calculationBottomBarHeight() {
    double baseHeight = 60.0;
    if (isOpenKeyboard && !isShowPanel) {
      return baseHeight + MediaQuery.of(context).viewInsets.bottom;
    } else if (isShowPanel && !isOpenKeyboard) {
      return baseHeight + 120;
    }
    return 60;
  }

  BottomAppBar _buildButtomTest() {
    //服务端设置如果没有开启支付功能，此处隐藏按钮
    return BottomAppBar(
      elevation: .0,
      child: Container(
        height: calculationBottomBarHeight(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: buttomContainer(),
        ),
      ),
    );
  }

  List<Widget> buttomContainer() {
    List<Widget> bcs = [_buildButtom()];
    if (isShowPanel) {
      bcs.add(_buildActionPanel());
    }
    return bcs;
  }

  Widget _buildButtom() {
    return Container(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 0.0, left: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
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
    );
  }

  Widget _buildActionPanel() {
    return isShowPanel
        ? Container(
            padding: EdgeInsets.only(top: 15, bottom: 15),
            margin: EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _getWidgetList(),
            ),
          )
        : SizedBox();
  }

  List<Widget> _getWidgetList() {
    List<Widget> ws = [
      IconWordButton(
        text: "照片",
        icon: Icon(
          Icons.perm_media,
          size: 32,
        ),
        func: () async {
          var image = await ImagePicker.pickImage(source: ImageSource.gallery);
        },
      ),
      IconWordButton(
        text: "相机",
        icon: Icon(
          Icons.camera_enhance,
          size: 32,
        ),
        func: () async {
          var image = await ImagePicker.pickImage(source: ImageSource.camera);
        },
      ),
      IconWordButton(
        text: "视频通话",
        icon: Icon(
          Icons.videocam,
          size: 32,
        ),
        func: () {
          Routes.router.navigateTo(
            context,
            Routes.chatVideoCall,
            clearStack: false,
            transition: TransitionType.cupertino,
          );
        },
      ),
      SizedBox(
        width: 50,
      )
    ];
    return ws;
  }
}
