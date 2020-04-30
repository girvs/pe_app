import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lpinyin/lpinyin.dart';
import 'package:pe_app/models/city_model.dart';
import 'package:pe_app/style/theme.dart';

class MyFriendListPage extends StatefulWidget {
  @override
  _MyFriendListPageState createState() => _MyFriendListPageState();
}

class _MyFriendListPageState extends State<MyFriendListPage> {
  List<CityInfo> _cityList = List();

  int _suspensionHeight = 40;
  int _itemHeight = 50;
  String _suspensionTag = "";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    //加载城市列表
    rootBundle.loadString('assets/data/china.json').then((value) {
      Map countyMap = json.decode(value);
      List list = countyMap['china'];
      list.forEach((value) {
        _cityList.add(CityInfo(name: value['name']));
      });
      _handleList(_cityList);
      setState(() {});
    });
  }

  void _handleList(List<CityInfo> list) {
    if (list == null || list.isEmpty) return;
    for (int i = 0, length = list.length; i < length; i++) {
      String pinyin = PinyinHelper.getPinyinE(list[i].name);
      String tag = pinyin.substring(0, 1).toUpperCase();
      list[i].namePinyin = pinyin;
      if (RegExp("[A-Z]").hasMatch(tag)) {
        list[i].tagIndex = tag;
      } else {
        list[i].tagIndex = "#";
      }
    }
    //根据A-Z排序
    SuspensionUtil.sortListBySuspensionTag(_cityList);
  }

  void _onSusTagChanged(String tag) {
    setState(() {
      _suspensionTag = tag;
    });
  }

  Widget _buildSusWidget(String susTag, bool isHeader) {
    return Column(
      children: <Widget>[
        Divider(height: 0),
        Container(
          height: _suspensionHeight.toDouble(),
          padding: const EdgeInsets.only(left: 25.0),
          color: Theme.of(context).backgroundColor,
          alignment: Alignment.centerLeft,
          child: Text(
            susTag,
            softWrap: false,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
        Divider(height: 1),
      ],
    );
  }

  Widget _buildListItem(CityInfo model) {
    String susTag = model.getSuspensionTag();
    return Column(
      children: <Widget>[
        Offstage(
          offstage: model.isShowSuspension != true,
          child: _buildSusWidget(susTag, true),
        ),
        Container(
          color: Constants.containerColor,
          child: ListTile(
            selected: false,
            dense: true,
            leading: FLImage(
              borderRadius: BorderRadius.circular(5),
              image: AssetImage('assets/girl/1.jpg'),
              width: 38,
              height: 38,
              fit: BoxFit.fill,
              //onPressed: (){},
            ),
            title: Text(
              model.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        Divider(height: 1),
      ],
    );
  }

  Widget buildTitle(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Constants.containerColor,
      child: ListTile(
        title: Text("新的朋友"),
        leading: FLAvatar(
          image: Image.asset('assets/images/contacts/plugins_Friend.png',
              scale: 2),
          width: 35,
          height: 35,
          radius: 0, // if not specify, will be width / 2
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(height: 1),
        Expanded(
          flex: 1,
          child: AzListView(
            data: _cityList,
            shrinkWrap: true,
            itemBuilder: (context, model) => _buildListItem(model),
            suspensionWidget: _buildSusWidget(_suspensionTag, false),
            isUseRealIndex: true,
            itemHeight: _itemHeight,
            suspensionHeight: _suspensionHeight,
            onSusTagChanged: _onSusTagChanged,
            header: AzListViewHeader(
              tag: "★",
              height: 55,
              builder: buildTitle,
            ),
            indexHintBuilder: (context, hint) {
              return Container(
                alignment: Alignment.center,
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  color: Constants.isDark ? Colors.white : Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Text(hint,
                    style: TextStyle(color: Colors.white, fontSize: 30.0)),
              );
            },
          ),
        ),
      ],
    );
  }
}
