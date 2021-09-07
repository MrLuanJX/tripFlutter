import 'package:flutter/material.dart';

class LearnBorrowTabDemo {
  final String title;
  final Widget widget;

  const LearnBorrowTabDemo({
   required this.title,
   required this.widget,
  });
}

class LearnBorrowDemoTabs extends StatelessWidget {
  final String title;
  final List<LearnBorrowTabDemo> tabs;
  final bool tabScrollable;
  final TabController tabController;
  final TextStyle labelTextStyle;
  final TextStyle unSelectedStyle;
  final Color unselectedLabelColor;
  final Color normarLabelColor;


  LearnBorrowDemoTabs({
   required this.title,
   required this.tabs,
   this.tabScrollable = true,
   required this.tabController,
   required this.labelTextStyle, 
   required this.unSelectedStyle,
   required this.unselectedLabelColor,
   required this.normarLabelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
        textTheme: TextTheme(//设置AppBar上面各种字体主题色
          title: TextStyle(
            color: Color(0xFF333333),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(      
          icon: Icon(Icons.arrow_back_ios),
          color: Color(0xFF333333),
          onPressed: (){
            print('add click....');
            Navigator.of(context).pop('');
          }
        ),
        backgroundColor: Colors.white, 
        bottom: TabBar(           
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: this.normarLabelColor,
          unselectedLabelColor:this.unselectedLabelColor,
          indicatorWeight: 3,
          indicatorColor: Color(0xFFEA521A),
          controller: this.tabController,
          isScrollable: this.tabScrollable,
          labelStyle: this.labelTextStyle,
          unselectedLabelStyle: this.unSelectedStyle,
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