import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pe_app/style/theme.dart';
import 'package:pe_app/view/components/hall/sycell.dart';
import 'package:pe_app/view/components/pe_container.dart';
import 'package:pe_app/view/components/space_size_box.dart';

class CashWithdrawalPage extends StatefulWidget {
  @override
  _CashWithdrawalStatePage createState() => _CashWithdrawalStatePage();
}

class _CashWithdrawalStatePage extends State<CashWithdrawalPage> {
  @override
  Widget build(BuildContext context) {
    var isDark = Theme.of(context).brightness == Brightness.dark;
    var selectColor = isDark ? Colors.white : Colors.yellow[900];
    final txtAliPayAccount = ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: 40, maxWidth: MediaQuery.of(context).size.width - 40),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 4.0),
          hintText: '支付宝邮箱账号',
          prefixIcon: Icon(FontAwesome.envelope, size: 16),
        ),
      ),
    );
    final txtAlipayName = ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: 40, maxWidth: MediaQuery.of(context).size.width - 40),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 4.0),
          hintText: '支付宝账号对应姓名',
          prefixIcon: Icon(FontAwesome.user_circle, size: 16),
        ),
      ),
    );

    final txtBalance = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      initialValue: '',
      obscureText: false,
      style: TextStyle(fontSize: 50),
      decoration: InputDecoration(
        icon: Icon(FontAwesome.rmb,size: 35),
        hintText: '0.00',
        contentPadding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
        border: OutlineInputBorder(borderSide: BorderSide.none),
        hintStyle: TextStyle(fontSize: 50),
        fillColor: Constants.getCurrenThemeContainerColor(Theme.of(context).brightness)
      ),
    );

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
            icon: Icon(AntDesign.alipay_square, size: 20, color: Colors.blue),
            title: '支付宝',
          ),
          PeContainer(
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            //color: Constants.containerColor,
            child: txtAliPayAccount,
          ),
          PeContainer(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
            //color: Constants.containerColor,
            child: txtAlipayName,
          ),
          Divider(height: 1),
          SpaceSizeBox(height: 20),
          Divider(height: 1),
          PeContainer(
            //color: Constants.containerColor,
            padding: EdgeInsets.only(top: 18, bottom: 0, left: 20),
            child: Text("提现金额"),
          ),
          PeContainer(
            //color: Constants.containerColor,
            padding: EdgeInsets.only(top: 18, bottom: 0, left: 20),
            child: txtBalance,
          ),
          Divider(height: 1),
          PeContainer(
            //color: Constants.containerColor,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                PeContainer(
                  //color: Constants.containerColor,
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 20),
                  child: Text("可用余额 0.00 元"),
                ),
                PeContainer(
                  //color: Constants.containerColor,
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 20,right: 20),
                  child: Text("全部提现"),
                ),
              ],
            ),
          ),
          Divider(height: 1),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: PeContainer(
          //color: isDark ? Constants.containerColor : selectColor,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment(0, 0),
          height: 50,
          child: Text(
            "预计24小时完成到账，确认提现",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200),
          ),
        ),
      ),
    );
  }
}
