import 'package:flutter/material.dart';

class LBTabDemo {
  final String title;
  final Widget widget;

  const LBTabDemo({
   required this.title,
   required this.widget,
  });
}

class LBDemoTabs extends StatelessWidget {
  final String title;
  final List<LBTabDemo> tabs;
  final bool tabScrollable;
  final TabController tabController;

  LBDemoTabs({
   required this.title,
   required this.tabs,
   this.tabScrollable = true,
   required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        //  backgroundColor: Colors.green,
 
        bottom: TabBar(            
          indicatorSize: TabBarIndicatorSize.tab,
          unselectedLabelColor:Colors.yellow,
          indicatorColor: Colors.white,
          controller: this.tabController,
          isScrollable: this.tabScrollable,
          tabs: this.tabs.map((item) => Tab(text: item.title)).toList(),
        ),
      ),
      body: TabBarView(
        controller: this.tabController,
        children: this.tabs.map((item) => item.widget).toList(),
      ),
    );
  }
}