import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pe_app/view/components/hall/sycell.dart';
import 'package:pe_app/view/components/space_size_box.dart';

class CashWithdrawalPage extends StatefulWidget {
  @override
  _CashWithdrawalStatePage createState() => _CashWithdrawalStatePage();
}

class _CashWithdrawalStatePage extends State<CashWithdrawalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提现"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          SpaceSizeBox(height: 10),
          Divider(height: 1),
          SyCell(
            isShowLine: true,
            icon: Icon(AntDesign.alipay_square,size: 20,),
            title: '支付宝',
          )
        ],
      ),
    );
  }
}
