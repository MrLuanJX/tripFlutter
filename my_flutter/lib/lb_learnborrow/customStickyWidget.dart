// import 'dart:math';
import 'package:flutter/material.dart';
import '../common/demo_tabs.dart';
import '../lb_learnborrow/lbOrder.dart';
import '../lb_learnborrow/learnborrowTabs.dart';
import '../lb_learnborrow/commonSliverHeaderDelegate.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'dart:ui';

const APPBAR_SCROLL_OFFSET = 100;

class StickyDemoWidget extends StatefulWidget {
  final String title;

  StickyDemoWidget({Key? key,required this.title}) : super(key: key);

  @override
  _StickyDemoWidgetState createState() => _StickyDemoWidgetState();
}

class _StickyDemoWidgetState extends State<StickyDemoWidget>
    with SingleTickerProviderStateMixin {

  List imgList = [
    'https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/CghzfVWw6OaACaJXABqNWv6ecpw824_C_500_280_Q90.jpg',
    'https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/jdsc_640es_tab1.jpg',
    "https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/300h0u000000j05rnD96B_C_500_280.jpg",
    "https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/100h10000000q7ght9352.jpg",
  ];

 late final TabController tabController;

 late final ScrollController _scrollController;

  double topQuickOpacity = 0.0;
 
  // 判断滚动改变透明度
  void _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }

  double appBarAlpha = 0; 

  @override
  void initState() {
    super.initState();
    this.tabController = TabController(length: 2, vsync: this);
    _scrollController = ScrollController();
    // _scrollController.addListener(() {
    //   print('_scrollController ${_scrollController.offset}');
    // });
     _scrollController
      ..addListener(() {
        int offset = _scrollController.offset.ceil();
        this.setState(() {
          topQuickOpacity = offset > 360 ? 1.0 : 0.0;
          print('_scrollController ${_scrollController.offset}');
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    this.tabController.dispose();
  }

  Widget blueWidget() {
    return Container(
        height: 200,
        color: Colors.blue,
    );
  }

  Widget yellowWidget() {
    return Container(
        height: 160,
        color: Colors.yellow,
    );
  }

  Widget redWidget() {
    return Container(
        height: 100,
        color: Colors.red,
    );
  }

  Widget greenWidget() {
    return Container(
        height: 600,
        color: Colors.green,
    );
  }

    Widget _banner() {
    return Container(
      // margin: EdgeInsets.all(16),
      height: 200,
      child: ClipRRect(
        // borderRadius:BorderRadius.circular(10),
        child: Swiper(
          autoplay: true,
          loop: true,
          pagination: SwiperPagination(),
          itemCount: imgList.length,
          itemBuilder:(context, index) {
            return Hero(
              tag: imgList[index],
              child: Image.network(imgList[index],fit: BoxFit.cover,),
            );
          },
          onTap:(index){ print('点击第${index}个banner');},
        ),
      ),
    );
  }
  
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('首页'),
        textTheme: TextTheme(//设置AppBar上面各种字体主题色
          title: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),       
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: <Widget>[
                // DTMessageSearchDecoration(),
                // DTMessageTopQuick(),
                // DTMessageTopMask(),
                // DTMessageListView(),
                _banner(),
                yellowWidget(),
                redWidget(),
                blueWidget(),
                greenWidget(),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
                opacity: topQuickOpacity,
                duration: Duration.zero,
                child:
                    Container(color: Colors.white, child: redWidget())),
          ),
        ],
      ),
    );
  }
  
  /*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: NotificationListener(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification &&
                    scrollNotification.depth == 0) {
                  //滚动且是列表滚动的时候
                  _onScroll(scrollNotification.metrics.pixels);
                }
                return false;
              },
              child: childWidget(),
            ),
          ),
          Opacity(
            opacity: appBarAlpha,
            child: Container(
              height: 108,
              decoration: BoxDecoration(color: Colors.blue),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    '首页',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  */
  Widget childWidget() {
    return Stack(
        children: <Widget>[
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: <Widget>[
                _banner(),
                yellowWidget(),
                redWidget(),
                blueWidget(),
                greenWidget(),
              ],
            ),
          ),
          Positioned(
            top: 108,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              opacity: topQuickOpacity,
              duration: Duration.zero,
              child:
                Container(color: Colors.white, child: redWidget())),
          ),
        ],
      );
  }

  Widget tabStopWidget() {
    return Material(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            // SliverAppBar(
            //     pinned: true,
            //     floating: true,
            //     elevation: 0,
            //     expandedHeight: 250,
            //     flexibleSpace: FlexibleSpaceBar(
            //       title: Text('定义组件高度'),
            //       background: Image.network(
            //         'http://img1.mukewang.com/5c18cf540001ac8206000338.jpg',
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            // ),
            SliverPersistentHeader(
              floating: true,
              pinned: true,
              delegate: CommonSliverHeaderDelegate(
                islucency: false,
                child:PreferredSize(
                  preferredSize: Size.fromHeight(108),//定义组件高度，必须写。
                  child: Image.network('http://img1.mukewang.com/5c18cf540001ac8206000338.jpg',fit: BoxFit.cover),
                ),
              ),
            ),

            SliverPersistentHeader(
                floating: true,
                pinned: true,
                delegate: CommonSliverHeaderDelegate(
                    islucency: false,//需要淡入淡出
                    child:PreferredSize(//这里传入PreferredSize组件，必须是这个，因为咱们自定义中接收到就是这个。
                      preferredSize: Size.fromHeight(60),//定义组件高度，必须写。
                      child: Row(//自由发挥
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            alignment: Alignment.center,
                            child: Text('sdfsdf',style:TextStyle(fontSize:14,color:Colors.black)),
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            alignment: Alignment.center,
                            child: Text('sdfsdf',style:TextStyle(fontSize:14,color:Colors.black)),
                          ),
                          Container(
                            padding: EdgeInsets.all(20),
                            alignment: Alignment.center,
                            child: Icon(Icons.add),
                          ),
                        ],
                      )
                    )
                )),
            SliverPersistentHeader(
                floating: true,
                pinned: true,
                delegate: CommonSliverHeaderDelegate(
                    islucency: false,
                    child:PreferredSize(
                      preferredSize: Size.fromHeight(48),//定义组件高度，必须写。
                      child:Material(
                        child: TabBar(
                          labelColor: Colors.black,
                          controller: this.tabController,
                          tabs: <Widget>[
                            Tab(text: '资讯'),
                            Tab(text: '技术'),
                          ],
                        ),
                      ),
                    ),
                ),
            ),
            // SliverAppBar(
            //     pinned: true,
            //     floating: true,
            //     bottom: PreferredSize(
            //       preferredSize: Size(double.infinity,48),
            //       child:TabBar(
            //         indicatorPadding: EdgeInsets.all(10),
            //         labelColor: Colors.black,
            //         controller: this._tabController,
            //         tabs: <Widget>[
            //           Tab(text: '资讯'),
            //           Tab(text: '技术'),
            //         ],
            //       ),
            //     )
            // ),
            //   SliverGrid(
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 3),
            //   delegate:
            //       SliverChildBuilderDelegate((BuildContext context, int index) {
            //     return Container(
            //       color: Colors.primaries[index % Colors.primaries.length],
            //     );
            //   }, childCount: 20),
            // ),
          ];
        },
        body: tableViewWidget(),
      ),
    );
  }

  Widget tableViewWidget() {
    return TabBarView(
          controller: this.tabController, //tabbar控制器
          children: <Widget>[
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.yellow,
              child:GridView(
                padding: EdgeInsets.all(0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 3),
                children: List.generate(
                  Colors.primaries.length,
                  (index) =>  Container(
                    color: Colors.primaries[index % Colors.primaries.length],
                  ),
                ),
              ),
            ),
          ],
    );
  }

  Widget bodyWidget(){
    return Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: NotificationListener(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification &&
                    scrollNotification.depth == 0) {
                  //滚动且是列表滚动的时候
                  _onScroll(scrollNotification.metrics.pixels);
                }
                return false;
              },
              child: tableViewWidget(),//OrderWidget(),
            ),
          ),
          Opacity(
            opacity: appBarAlpha,
            child: Container(
              height: 108,
              decoration: BoxDecoration(color: Colors.blue),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    '首页',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
    );
  }

  Widget topTab() {
    return Container (
      height: 200,
      color: Colors.red,
    );
  }

  Widget listWidget() {
    return Container(
      color: Colors.yellow,
      child: GridView(
        padding: EdgeInsets.all(0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 3),
          children: List.generate(
            Colors.primaries.length,
            (index) =>  Container(
              color: Colors.primaries[index % Colors.primaries.length],
          ),
        ),
      ),
    );
  }

}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return this.child;
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

