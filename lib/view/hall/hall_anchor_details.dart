import 'package:flutter/material.dart';
import 'package:pe_app/view/components/icon_word_button.dart';

class HallAnchorDetailsPage extends StatefulWidget {
  @override
  _HallAnchorDetailsPageState createState() => _HallAnchorDetailsPageState();
}

class _HallAnchorDetailsPageState extends State<HallAnchorDetailsPage> {
  @override
  bool _isShowPanel = false;
  FocusNode _focusNode = FocusNode();
  double keyBorderHeight = 0;
  @override
  void initState() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _isShowPanel = false;
        keyBorderHeight = MediaQuery.of(context).viewInsets.bottom;
        setState(() {});
      }
      else{
        keyBorderHeight = 0.0;
      }
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return 
    Scaffold(
      resizeToAvoidBottomPadding:false,
      appBar: AppBar(
        title: Text("详细"),
      ),
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child:Column(
        children: <Widget>[
          Text("asdfasfdasfd"),
          Text("asdfasfdasfd"),
          Text("asdfasfdasfd"),
          Text("asdfasfdasfd"),
          Text("asdfasfdasfd"),
        ],
      ),),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  double _calculationAppbarHeight() {
    print(keyBorderHeight);
    if (_isShowPanel) {
      return 180.00;
    } else {
      return keyBorderHeight + 65.00;
    }
  }

  _buildBottomBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: _buildButtom(),
    );
  }

  Widget _buildButtom() {
    return Container(
      height: _calculationAppbarHeight(),
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 5.0, left: 5.0),
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
              Flexible(
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
                    Icons.add_circle_outline,
                    size: 35,
                  ),
                  onPressed: () {
                    _isShowPanel = !_isShowPanel;
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
          _isShowPanel ? _buildActionPanel() : Container()
        ],
      ),
    );
  }

  _buildActionPanel() {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _getWidgetList(),
      ),
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
