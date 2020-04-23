import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pe_app/view/components/hall/sycell.dart';

class DetailListPage extends StatefulWidget {
  @override
  _DetailListPageState createState() => _DetailListPageState();
}

class _DetailListPageState extends State<DetailListPage> {
  var headerIndex = 0;
  List<Widget> _buildSlivers() {
    List<Widget> children = [
      _buildGroup(DateTime(2020, 04, 01)),
      _buildGroup(DateTime(2020, 03, 01)),
      _buildGroup(DateTime(2020, 02, 01)),
      _buildGroup(DateTime(2020, 01, 01))
    ];
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('明细'),
        centerTitle: true,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: _buildSlivers(),
      ),
    );
  }

  Widget _buildGroup(DateTime date) {
    ThemeData themeData = Theme.of(context);
    return FLSliverPersistentHeaderWidgetBuilder(
      overlapsContent: false,
      builder: (context, state) {
        return Container(
          color: themeData.brightness == Brightness.light
              ? Color.fromRGBO(246, 246, 246, 1)
              : themeData.cardColor,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                  '${date.year.toString()}-${date.month.toString().padLeft(2, '0')}月份'),
              Column(
                children: <Widget>[
                  Text("本月充值 ￥ 2222.00"),
                  Text("本月消费 ￥ 1290.00"),
                ],
              ),
            ],
          ),
        );
      },
      content: SliverList(
        delegate: SliverChildBuilderDelegate((context, i) {
          var now = DateTime.now();
          return FLListTile(
            onTap: () {},
            contentPadding:
                EdgeInsets.only(left: 18, right: 18, top: 0, bottom: 0),
            dense: false,
            selected: false,
            leading: Icon(
              AntDesign.pay_circle1,
              size: 35,
              color: Colors.yellow,
            ),
            title: Text('视频通话${i.toString()}分钟'),
            subtitle: Text(
                "${now.year.toString()}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}"),
            trailing: Text("-${(i).toString()}元"),
          );
        }, childCount: 15),
      ),
    );
  }
}
