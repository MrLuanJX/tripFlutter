import 'package:flutter/material.dart';
import '../lb_learnborrow/lb_staggeredGridView.dart';
import '../lb_learnborrow/lb_mine.dart';
import '../lb_learnborrow/lbOrder.dart';
import '../lb_tabWidgets/guessLikeList.dart';
import '../lb_learnborrow/travelTabPage.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator({Key? key}) : super(key: key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  PageController _controller = PageController(initialPage: 0);  // 页面控制器
  Color _defaultColor = Colors.grey; // 默认颜色
  Color _activeColor = Colors.blue; // 激活状态颜色
  int _currentIndex = 0; // 当前索引
  DateTime? _lastPressedAt; // 上次点击的时间

  @override 
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: exitApp,
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _controller,
          children: [
            StaggerWidget(),
            OrderWidget(),
            TravelTabPage(),
            MineWidget(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedLabelStyle: TextStyle(color: _activeColor),
        unselectedLabelStyle: TextStyle(color: _defaultColor),
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          _controller.jumpToPage(index);
          setState((){
            _currentIndex = index;
          });
        },
        items: [
          _bottomItem(Icons.home, '首页', 0),
          _bottomItem(Icons.search, '搜索', 1),
          _bottomItem(Icons.camera_alt, '旅拍', 2),
          _bottomItem(Icons.account_circle, '我的', 3),
        ],
      ),
    );
  }

  BottomNavigationBarItem _bottomItem(IconData icon, String label, int index){
    return BottomNavigationBarItem(
      icon: Icon(icon, color:_defaultColor),
      activeIcon: Icon(icon, color:_activeColor),
      label: label,
    );
  }

  // 退出app
  Future<bool> exitApp() async {
    if (_lastPressedAt == null ||
        DateTime.now().difference(_lastPressedAt!) > Duration(seconds: 2)) {
      //两次点击间隔超过2秒则重新计时
      _lastPressedAt = DateTime.now();
      return Future.value(false);
    }
    return Future.value(true);
  }
}
