import 'package:flutter/material.dart';

class DetailListPage extends StatefulWidget {
  @override
  _DetailListPageState createState() => _DetailListPageState();
}

class _DetailListPageState extends State<DetailListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("明细"),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
