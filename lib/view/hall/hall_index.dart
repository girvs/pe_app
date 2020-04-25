import 'dart:math';

import 'package:flui/flui.dart';
import 'package:fluro/fluro.dart';
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
          floating: true,
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
                padding: EdgeInsets.only(top: 10, bottom: 10),
                //padding: EdgeInsets.only(left: 10),
                color: Theme.of(context).appBarTheme.color,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: _buildCatalogList(),
                )),
          ),
        ),
        SliverGrid(
          delegate:
              SliverChildBuilderDelegate(_buildListCardItem, childCount: 20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1.4,
          ),
        ),
      ],
    );
  }

  // Map<String, Text> map = {
  //   '全部': Text('全部'),
  //   '最新': Text('最新'),
  //   '最热': Text('最热'),
  //   '好评': Text('好评')
  // };
  // String _fruit = '全部';

  // Widget _buildCatalog() => CupertinoSegmentedControl(
  //       children: map, // 数据
  //       groupValue: _fruit, // 选中的数据
  //       onValueChanged: (fruit) {
  //         setState(() {
  //           // 数据改变时通过setState改变选中状态
  //           _fruit = fruit;
  //         });
  //       },
  //       unselectedColor: CupertinoColors.white, // 未选中颜色
  //       selectedColor: CupertinoColors.activeBlue, // 选中颜色
  //       borderColor: CupertinoColors.activeBlue, // 边框颜色
  //       pressedColor: const Color(0x33007AFF), // 点击时候的颜色
  //     );

  List<String> dataList = ["全部", "最新", "最热", "好评"];
  int _value = 0;
  List<Widget> _buildCatalogList() {
    return List<Widget>.generate(
      dataList.length,
      (int index) => Container(
        margin: EdgeInsets.only(left: 10),
        child: ChoiceChip(
          //padding: EdgeInsets.only(left: 20),
          labelPadding: EdgeInsets.only(left: 15, right: 15),
          //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          //elevation: 100,
          //avatarBorder: const CircleBorder(side: BorderSide.(11, 11)),
          label: Text(dataList[index]),
          selectedColor: Theme.of(context).buttonColor,
          selected: _value == index,

          onSelected: (bool selected) {
            setState(() {
              print(index);
              _value = selected ? index : null;
            });
          },
        ),
      ),
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
      height: 160.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            _imageUrl[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: _imageUrl.length,
        scrollDirection: Axis.horizontal,
        loop: true,
        duration: 300,
        autoplay: true,
        onIndexChanged: (index) {
          //debugPrint("index:$index");
        },
        onTap: (index) {
          //debugPrint("点击了第:$index个");
        },
        pagination: SwiperPagination(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(
            bottom: 0.0,
            right: 20.0,
          ),
          builder: SwiperPagination.dots,
        ),
        autoplayDisableOnInteraction: true,
      ),
    );
  }

  Widget _buildListCardItem(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        Routes.router.navigateTo(
          context,
          Routes.hallAnchorDetailsPage,
          transition: TransitionType.cupertino,
        );
      },
      child: Card(
        
        elevation: 00.0,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset(
                  Random().nextInt(3) % 2 > 0
                      ? 'assets/girl/1.jpg'
                      : 'assets/girl/2.jpg',
                  height: (MediaQuery.of(context).size.width / 2 - 5) / 16 * 9,
                  width: MediaQuery.of(context).size.width / 2 - 5,
                  fit: BoxFit.cover,
                ),
                Container(
                  child: Text('宝贝很乖很乖哟'),
                ),
              ],
            ),
            Positioned(
              bottom: 25,
              left: 10,
              child: Text(
                "22人关注",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              bottom: 25,
              right: 10,
              child: Text(
                "￥5/分钟",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  // Widget _buildListCardItem(BuildContext context, int index) {
  //   return Container(
  //     padding: EdgeInsets.all(0),
  //     //height: 180,
  //     decoration: new BoxDecoration(
  //       borderRadius: BorderRadius.all(Radius.circular(0.0)),
  //       border:
  //           new Border.all(width: 1, color: Color.fromARGB(255, 225, 225, 225)),
  //     ),
  //     child: Column(
  //       // crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Image.asset(
  //           index % 2 > 0 ? 'assets/girl/1.jpg' : 'assets/girl/2.jpg',
  //           fit: BoxFit.fill,
  //           height: (MediaQuery.of(context).size.width / 2 - 5) / 16 * 9,
  //           width: MediaQuery.of(context).size.width / 2 - 5,
  //         ),
  //         // SizedBox(
  //         //   height: 2,
  //         // ),

  //         ListTile(
  //           isThreeLine: true,
  //           //contentPadding: EdgeInsets.all(0),
  //           title: Text("静静的等待", overflow: TextOverflow.ellipsis),
  //           subtitle: Text("超级无级美少女战士！",
  //               maxLines: 1, overflow: TextOverflow.ellipsis),
  //           trailing: Icon(Icons.attach_money),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
