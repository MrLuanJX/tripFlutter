import 'package:flutter/material.dart';
import '../lb_learnborrow/mock_datas.dart';
import '../lb_learnborrow/orderCell.dart';

class OrderWidget extends StatelessWidget{
  const OrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    // Container(
      // padding: EdgeInsets.all(16),
      // color: Color(0xFFEFEFEF),
      // child:
       ListView.builder(
        itemCount: orderList.length,
        itemBuilder: (context , index) {
          return LBOrderCellWidget(orderViewModel: orderList[index]);
        },
      // ),
    );
  }
}

