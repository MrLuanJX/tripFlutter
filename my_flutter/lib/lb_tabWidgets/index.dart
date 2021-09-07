import 'package:flutter/material.dart';
import '../lb_tabWidgets/lbTabs.dart';
import '../lb_tabWidgets/colorGrids.dart';
import '../grid_view/service_categories.dart';
import '../lb_tabWidgets/guessLikeList.dart';

class LBTabControllerDemo extends StatefulWidget {
  @override
  _LBTabControllerDemoState createState() => _LBTabControllerDemoState(); 
}

class _LBTabControllerDemoState extends State<LBTabControllerDemo> with SingleTickerProviderStateMixin{
  
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
    return LBDemoTabs(
      tabs:tabs,
      title: 'GirdView',
      tabController: this.tabController,
    );
  }
}

final List<LBTabDemo>tabs = [
  LBTabDemo(title:'彩色格子',widget:ColorGridsWidget()),
  LBTabDemo(title:'美团 - 服务菜单', widget: ServiceCategories()),
  LBTabDemo(title:'喜马拉雅 - 相声列表', widget:LBGuessLikeList()),
  LBTabDemo(title:'彩色格子',widget:ColorGridsWidget()),
  LBTabDemo(title:'美团 - 服务菜单', widget: ServiceCategories()),
  LBTabDemo(title:'喜马拉雅 - 相声列表', widget:LBGuessLikeList()),
];

class LBModel {
  final String title;

  LBModel({required this.title});
}

final List<LBModel>models = [
  LBModel(
    title: '1',
  ),
  LBModel(
    title: '2',
  ),
  LBModel(
    title: '3',
  ),
  LBModel(
    title: '4',
  ),
  LBModel(
    title: '5',
  ),
  LBModel(
    title: '6',
  ),
  LBModel(
    title: '7',
  ),
  LBModel(
    title: '8',
  ),
  LBModel(
    title: '9',
  ),
  LBModel(
    title: '10',
  ),
];