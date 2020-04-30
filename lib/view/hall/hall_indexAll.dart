import 'dart:math';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pe_app/core/route/routes.dart';

class HallIndexAllPage extends StatefulWidget {
  @override
  _HallIndexAllPageState createState() => _HallIndexAllPageState();
}

class _HallIndexAllPageState extends State<HallIndexAllPage>
    with SingleTickerProviderStateMixin {
  List _imageUrl = [
    'https://dimg04.c-ctrip.com/images/zg0o180000014yl20DEA4.jpg',
    'https://dimg04.c-ctrip.com/images/zg0o180000014yl20DEA4.jpg',
    'https://dimg04.c-ctrip.com/images/zg0o180000014yl20DEA4.jpg',
    'https://dimg04.c-ctrip.com/images/zg0o180000014yl20DEA4.jpg',
    'https://dimg04.c-ctrip.com/images/zg0o180000014yl20DEA4.jpg',
  ];
  TabController tabController;
  ScrollController pageController = ScrollController();
  @override
  void initState() {
    super.initState();
    this.tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      //controller: pageController,
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
          floating: false,
          delegate: StickyTabBarDelegate(
            child: TabBar(
              isScrollable: true,
              controller: this.tabController,
              tabs: <Widget>[
                Tab(text: '全部'),
                Tab(text: '最新'),
                Tab(text: '最热'),
                Tab(text: '同城'),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: true,
          child: TabBarView(
            controller: this.tabController,
            children: <Widget>[
              _buildList(),
              _buildList(),
              _buildList(),
              _buildList(),
            ],
          ),
        ),
      ],
    );
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
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),borderSide: BorderSide.none),
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

  _buildList() {
    return GridView.builder(
      //physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 40,
      itemBuilder: _buildListCardItem,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 1.38,
      ),
    );
    // return SliverGrid(
    //   delegate: SliverChildBuilderDelegate(_buildListCardItem, childCount: 20),
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //     crossAxisCount: 2,
    //     mainAxisSpacing: 10.0,
    //     crossAxisSpacing: 10.0,
    //     childAspectRatio: 1.4,
    //   ),
    // );
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
        clipBehavior: Clip.hardEdge,
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
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Theme.of(context).appBarTheme.color,
      child: child,
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
