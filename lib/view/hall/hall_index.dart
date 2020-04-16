import 'package:flui/flui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pe_app/core/route/routes.dart';
import 'package:pe_app/view/components/hall/sticky_bar_delegate.dart';

class HallIndexPage extends StatefulWidget {
  @override
  _HallIndexPageState createState() => _HallIndexPageState();
}

class _HallIndexPageState extends State<HallIndexPage>
    with SingleTickerProviderStateMixin {
  List _imageUrl = [
    'https://dimg04.c-ctrip.com/images/zg0o180000014yl20DEA4.jpg',
    'https://dimg04.c-ctrip.com/images/zg0f180000014vrut370F.jpg',
    'https://dimg04.c-ctrip.com/images/zg0n18000001528jhD6B2.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          elevation: 0,
          title: _buildSearchList(),
        ),
        SliverToBoxAdapter(
          child: _buildSwiper(),
        ),

        SliverPersistentHeader(
          pinned: true,
          delegate: StickyBarDelegate(
            minHeight: 50.0,
            maxHeight: 50.0,
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              height: 60,
              child: _buildCatalog(),
            ),
          ),
        ),
        SliverGrid(
          delegate:
              SliverChildBuilderDelegate(_buildListCardItem, childCount: 20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
        ),
      ],
    );
  }

  Map<String, Text> map = {
    '全部': Text('全部'),
    '最新': Text('最新'),
    '最热': Text('最热'),
    '好评': Text('好评')
  };
  String _fruit = '全部';

  Widget _buildCatalog() => CupertinoSegmentedControl(
        children: map, // 数据
        groupValue: _fruit, // 选中的数据
        onValueChanged: (fruit) {
          setState(() {
            // 数据改变时通过setState改变选中状态
            _fruit = fruit;
          });
        },
        unselectedColor: CupertinoColors.white, // 未选中颜色
        selectedColor: CupertinoColors.activeBlue, // 选中颜色
        borderColor: CupertinoColors.activeBlue, // 边框颜色
        pressedColor: const Color(0x33007AFF), // 点击时候的颜色
      );

  List<String> dataList = ["全部", "最新", "最热", "好评"];
  int _value = 0;
  List<Widget> _buildCatalogList() {
    return List<Widget>.generate(
      dataList.length,
      (int index) {
        return ChoiceChip(
          label: Text(dataList[index]),
          selected: _value == index,
          onSelected: (bool selected) {
            setState(() {
              _value = selected ? index : null;
            });
          },
        );
      },
    ).toList();
  }

  Widget _buildSearchList() {
    return Container(
      //width: MediaQuery.of(context).size.width,
      height: 40,
      child: TextFormField(
        autovalidate: true,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: '大厅搜索',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }

  _buildSwiper() {
    return Container(
      height: 250.0,
      child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              "http://img.zcool.cn/community/01ed9c55499c160000019ae993c9a4.jpg@2o.jpg",
              fit: BoxFit.fill,
            );
          },
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          loop: true,
          duration: 300,
          autoplay: true,
          onIndexChanged: (index) {
            debugPrint("index:$index");
          },
          onTap: (index) {
            debugPrint("点击了第:$index个");
          },
//                control:SwiperControl(),
          pagination: SwiperPagination(
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(bottom: 20.0, right: 20.0),
              builder: SwiperPagination.fraction),
//                autoplayDelay: 3000,
          autoplayDisableOnInteraction: true),
    );
  }

  Widget _buildListCardItem(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.all(0),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
        border:
            new Border.all(width: 1, color: Color.fromARGB(255, 225, 225, 225)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            index % 2 > 0 ? 'assets/girl/1.jpg' : 'assets/girl/2.jpg',
            fit: BoxFit.fill,
            height: 120,
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            "  静静的等待",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14),
          ),
          Text(
            "  超级无级美少女战士！",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 11),
          ),
          SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "人气：2000",
                style: TextStyle(fontSize: 11),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                "态度：极好",
                style: TextStyle(fontSize: 11),
              )
            ],
          )
        ],
      ),
    );
  }
}
