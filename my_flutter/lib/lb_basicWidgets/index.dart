import 'package:flutter/material.dart';

import '../basic_widgets/mock_data.dart';
import '../basic_widgets/pet_card.dart';
import '../basic_widgets/credit_card.dart';
import '../basic_widgets/friend_circle.dart';
import '../lb_tabWidgets/lbTabs.dart';
import '../lb_widgets/petCard.dart';
import '../lb_widgets/creditCard.dart';

List<LBTabDemo> tabs = [
  LBTabDemo(title: '宠物卡片', widget: PetCard(data: petCardData)),
  LBTabDemo(title: '银行卡', widget: CreditCard(data: creditCardData)),
  LBTabDemo(title: '微信朋友圈', widget: FriendCircle(data: friendCircleData)),
  LBTabDemo(title: '宠物卡片', widget: LBPetCardWidget(petModel: petCardData)),
  LBTabDemo(title: '银行卡', widget: CreditCardWidget(data: creditCardData)),
].map((item) => LBTabDemo(
  title: item.title,
  widget: Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[item.widget],
  ),
)).toList();

class LBBasicWidgetsDemo extends StatefulWidget {
  @override
  _LBBasicWidgetsDemoState createState() => _LBBasicWidgetsDemoState();
}

class _LBBasicWidgetsDemoState extends State<LBBasicWidgetsDemo>
    with SingleTickerProviderStateMixin {

  late final TabController tabController;
  
  @override
  void initState() {
    super.initState();
    this.tabController = new TabController(length: tabs.length, vsync: this);

   //目的可實施監聽,客戶點擊按鈕後要更新的動作
    this.tabController.addListener(() {
      print(this.tabController.index);
      setState(() {
        //裡面可寫更改頁面的東西
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    this.tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LBDemoTabs(
      title: '基础组件',
      tabs: tabs,
      // tabScrollable: false,
      tabController: this.tabController,
    );
  }
}
