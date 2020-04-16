import 'package:flutter/material.dart';
import 'package:pe_app/view/components/hall/sticky_bar_delegate.dart';

class MineIndexPage extends StatefulWidget {
  @override
  _MineIndexPageState createState() => _MineIndexPageState();
}

class _MineIndexPageState extends State<MineIndexPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    this.tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          elevation: 0,
          //expandedHeight: 250,
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 100,
            color: Colors.red,
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: StickyBarDelegate(
            maxHeight: 48,
            minHeight: 48,
            child: Container(height: 48,color: Colors.black,),
          ),
        ),
        SliverFillRemaining(
          child: TabBarView(
            controller: this.tabController,
            children: <Widget>[
              Center(child: Text('Content of Home')),
              Center(child: Text('Content of Profile')),
            ],
          ),
        ),
      ],
    );
  }
}

