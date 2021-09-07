import 'package:flutter/material.dart';
import '../lb_learnborrow/lbOrder.dart';
import 'dart:ui';
import '../lb_learnborrow/lb_mine.dart';

class LBOrderCellWidget extends StatelessWidget{
  final LBOrderViewModel orderViewModel;

  const LBOrderCellWidget({Key? key, required this.orderViewModel,}): super(key: key);

  Widget build(BuildContext context){
   return Container(
      height: 300,
      margin: EdgeInsets.fromLTRB(16,16, 16, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            spreadRadius: 4,
            color: Color.fromARGB(20, 0, 0, 0),
          ),
        ],
      ),
      child: Material(
        child: InkWell(
          onTap:(){print('单击cell');},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              this.orderNameWidget(),
              this.orderContext(),
              this.orderRepayMentBtnsWidget(context),
            ],
          ),
        ),
      ),
    );
  }
  // 标题
  Widget orderNameWidget(){
    return  Padding(
      padding: EdgeInsets.fromLTRB(15,15,15,0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget> [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${this.orderViewModel.schoolName} - ${this.orderViewModel.className}',
                style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
                ),
              ),
              Padding(padding:EdgeInsets.fromLTRB(0,30,0,0)),
              Container(
                color: Color(0xFFDBDBDB),
                width: 240.0,
                height: 0.5,
              ),
            ],
          ),
          Image.network(
            this.orderViewModel.orderTypeUrl,
            width: 100,
            height: 70,
            fit: BoxFit.cover,          
          ),
        ],
      ),
    );
  }
  // context
  Widget orderContext() {
    return Padding(
      padding: EdgeInsets.fromLTRB(15,15,15,15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '贷款金额：${this.orderViewModel.loanMoney.toString()}元（${this.orderViewModel.repaymentType}）',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF666666),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          Text(
            '申请时间：${this.orderViewModel.applyTime}',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF666666),
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                '银行卡：尾号${this.orderViewModel.cardNumber}（${this.orderViewModel.bankName}）',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF666666),
                ),
              ),
              SizedBox(width: 20), // 20宽度
              FlatButton(
                onPressed: ()=> print("FlatButton Pressed"),
                child: Row(
                  children: <Widget>[
                    Image.network(
                      this.orderViewModel.orderTypeUrl,
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,          
                    ),
                    Padding(padding: EdgeInsets.only(left: 5)),
                    Text(
                    '修改银行卡',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFFEA521A),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                '订单合同：',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF666666),
                ),
              ),
              SizedBox(
                height: 20,
                child:FlatButton(
                  onPressed: ()=> print('点击订单合同'),  
                  child: Text(
                    this.orderViewModel.orderType == 1 ? '预览合同': '查看合同',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFEA521A),
                    ),
                  ),
                ),
              ),
            ],
          ),                             
        ],
      ),
    );
  }
  // bottomBtns
  Widget orderRepayMentBtnsWidget(BuildContext context){
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Row(
        children: <Widget>[
          Flexible(fit: FlexFit.tight, child: SizedBox()),
          if(this.orderViewModel.orderType != 1 && this.orderViewModel.orderType != 4) OutlineButton(
            onPressed: ()=> print('点击OutlineButton'), 
            // onPressed: () {
            //     Navigator.of(context).push(
            //         MaterialPageRoute(builder: (context) => DioWidget()));
            // },
            borderSide:new BorderSide(color: Color(0xFFEA521A)),
            splashColor: Color(0xFFEA521A),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Color(0xFFEA521A),
                width: 1,
              ),
            borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Text(
              '线下还款账户',
              style: TextStyle(
               fontSize: 14,
               color: Color(0xFFEA521A),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 15)),
          OutlineButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MineWidget()));
              },
            borderSide:new BorderSide(color: Color(0xFFEA521A)),
            splashColor: Color(0xFFEA521A),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Color(0xFFEA521A),
                width: 1,
              ),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Text(
              this.orderViewModel.orderType == 1 ? '预览还款计划' : '还款计划',
              style: TextStyle(
               fontSize: 14,
               color: Color(0xFFEA521A),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LBOrderViewModel{
  final int orderType;
  final String orderTypeUrl;
  final String schoolName;
  final String className;
  final int loanMoney;
  final String repaymentType;
  final String applyTime;
  final String cardNumber;
  final String bankName;

  const LBOrderViewModel({
    required this.orderType,
    required this.orderTypeUrl,
    required this.schoolName,
    required this.className,
    required this.loanMoney,
    required this.repaymentType,
    required this.applyTime,
    required this.cardNumber,
    required this.bankName,
  });
}


