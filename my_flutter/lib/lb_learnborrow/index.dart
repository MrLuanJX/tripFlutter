import 'package:flutter/material.dart';
import '../lb_learnborrow/learnborrowTabs.dart';
import '../lb_tabWidgets/colorGrids.dart';
import '../grid_view/service_categories.dart';
import '../lb_tabWidgets/guessLikeList.dart';
import '../lb_learnborrow/lbOrder.dart';

class LBOrderTabControllerDemo extends StatefulWidget {
  @override
  _LBOrderTabControllerDemoState createState() => _LBOrderTabControllerDemoState(); 
}

class _LBOrderTabControllerDemoState extends State<LBOrderTabControllerDemo> with SingleTickerProviderStateMixin{
  
  late final TabController tabController;
  
  @override 
  void initState() {
    super.initState();
    this.tabController = new TabController(length:tabs.length,vsync:this);
  }

  @override
  void dispose() {
    super.dispose();

    this.tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LearnBorrowDemoTabs(
      tabs:tabs,
      title: '订单',
      tabScrollable: false,
      tabController: this.tabController,
      normarLabelColor: Color(0xFFEA521A),
      labelTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      unSelectedStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelColor: Color(0xFF333333),
    );
  }
}

final List<LearnBorrowTabDemo>tabs = [
  LearnBorrowTabDemo(title:'理享学',widget:OrderWidget()),
  LearnBorrowTabDemo(title:'理享+', widget: ServiceCategories()),
];
