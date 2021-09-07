import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'fullImage.dart';
import 'package:dio/dio.dart';
import '../lb_learnborrow/home_model.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'dart:ui';
import 'localNav.dart';
import '../lb_learnborrow/mock_datas.dart';
import '../lb_learnborrow/lbOrder.dart';
import 'gridNav.dart';
import 'subNav.dart';
import 'salesBox.dart';
import '../lb_learnborrow/commonSliverHeaderDelegate.dart';


const HOME_URL =
    'https://apk-1256738511.cos.ap-chengdu.myqcloud.com/FlutterTrip/data/home_page.json';
const APPBAR_SCROLL_OFFSET = 100;
const SEARCH_BAR_DEFAULT_TEXT = '网红打卡地 景点 酒店 美食';

/// 首页接口
class HomeDao {
  static Future<HomeModel> fetch() async {
    Response response = await Dio().get(HOME_URL);
    if (response.statusCode == 200) {
      return HomeModel.fromJson(response.data);
    } else {
      print('error');
      throw Exception('Failed to load home_page.json');
    }
  }
}

class StaggerWidget extends StatefulWidget {

  @override
  _StaggerWidgetState createState() => _StaggerWidgetState();
}

class _StaggerWidgetState extends State<StaggerWidget> with TickerProviderStateMixin{

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
 
  late final TabController tabController;

  late final ScrollController _scrollController;

  double topQuickOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    this.tabController = TabController(length: 2, vsync: this);
    _scrollController = ScrollController();

     _scrollController
      ..addListener(() {
        int offset = _scrollController.offset.ceil();
        this.setState(() {
          topQuickOpacity = offset > 920 ? 1.0 : 0.0; // 920  188+266+10
          // print('_scrollController ${_scrollController.offset}');
        });
      });
    super.initState();
  }

  // 加载首页数据
  Future _handleRefresh() async {
    try {
      HomeModel model = await HomeDao.fetch();
      print('model:------${model}');
      // setState(() {
        // bannerList = model.bannerList;
        // localNavList = model.localNavList;
        // gridNav = model.gridNav;
        // subNavList = model.subNavList;
        // salesBox = model.salesBox;
        // _loading = false;
      // });
    } catch (e) {
      print(e);
      // setState(() {
        // _loading = false;
      // });
    }
  }
  
  List imgList = [
    'https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/CghzfVWw6OaACaJXABqNWv6ecpw824_C_500_280_Q90.jpg',
    'https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/jdsc_640es_tab1.jpg',
    "https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/300h0u000000j05rnD96B_C_500_280.jpg",
    "https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/100h10000000q7ght9352.jpg",
  ];

 List staggerViewList = [
    "http://yanxuan.nosdn.127.net/65091eebc48899298171c2eb6696fe27.jpg",
    "http://yanxuan.nosdn.127.net/8b30eeb17c831eba08b97bdcb4c46a8e.png",
    "http://yanxuan.nosdn.127.net/a196b367f23ccfd8205b6da647c62b84.png",
    "http://yanxuan.nosdn.127.net/149dfa87a7324e184c5526ead81de9ad.png",
    "http://yanxuan.nosdn.127.net/88dc5d80c6f84102f003ecd69c86e1cf.png",
    "http://yanxuan.nosdn.127.net/8b9328496990357033d4259fda250679.png",
    "http://yanxuan.nosdn.127.net/c39d54c06a71b4b61b6092a0d31f2335.png",
    "http://yanxuan.nosdn.127.net/ee92704f3b8323905b51fc647823e6e5.png",
    "http://yanxuan.nosdn.127.net/e564410546a11ddceb5a82bfce8da43d.png",
    "http://yanxuan.nosdn.127.net/56f4b4753392d27c0c2ccceeb579ed6f.png",
    "http://yanxuan.nosdn.127.net/6a54ccc389afb2459b163245bbb2c978.png",
    'https://picsum.photos/id/101/548/338',
  ];
  
  @override
  Widget build(BuildContext context) {
    // _handleRefresh();
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

  Widget _tabWidget() {
    return TabBar(
      unselectedLabelColor: Colors.black,
      indicatorColor: Colors.blue,
      isScrollable: false,
      labelColor: Colors.blue,
      controller: this.tabController,
      tabs: <Widget>[
        Tab(text: '推荐'),
        Tab(text: '热门🔥'),
      ],
    );
  }
  
  Widget childWidget() {
    return Stack(
      children: <Widget> [
        NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverPersistentHeader(
                floating: true,
                pinned: false,
                delegate: CommonSliverHeaderDelegate(
                  islucency: false,
                  child:PreferredSize(
                    preferredSize: Size.fromHeight(200+188+10+266+120+290),//定义组件高度，必须写。
                    child:Material(
                      child: Column(
                        children: <Widget>[
                          _banner(),
                          Container(child:LocalNav(localNavList: localNavList),),
                          Padding(
                            padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
                            child: GridNavWidget(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: SubNav(subNavList: subNavList),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: SalesBoxWidget(),
                          ),
                          _tabWidget(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: this.tabController, //tabbar控制器
            children: <Widget>[
              _staggeredGridView(),
              Padding(padding: EdgeInsets.only(top:10),
                child:OrderWidget(),
              ),
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
              Container(color: Colors.white, child: _tabWidget())),
        ),
      ],
    );
  }
  
  /*
  Widget childWidget() {
    return Stack(
        children: <Widget>[
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: <Widget>[
                _banner(),
                Container(child:LocalNav(localNavList: localNavList),),
                Padding(
                  padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
                  child: GridNavWidget(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: SubNav(subNavList: subNavList),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: SalesBoxWidget(),
                ),
                _staggeredGridView(),
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
                Container(color: Colors.white, child: SubNav(subNavList: subNavList))),
          ),
        ],
      );
  }
  */
  Widget get _listView {
    return ListView(
      children: <Widget> [
        _banner(),
        LocalNav(localNavList: localNavList),
        Padding(
          padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
          child: GridNavWidget(),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: SubNav(subNavList: subNavList),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: SalesBoxWidget(),
        ),
        _staggeredGridView(),
      ],
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

  Widget _staggeredGridView(){
    return Container(
      padding: EdgeInsets.fromLTRB(0,10,0,0),
      child: StaggeredGridView.countBuilder(
        shrinkWrap: true, //解决无限高度问题
        physics: NeverScrollableScrollPhysics(),  // 处理GridView中滑动父级Listview无法滑动
        crossAxisCount: 4,
        itemCount: staggerViewList.length,
        itemBuilder: (context, i) { return itemWidget(i);},
        staggeredTileBuilder: (int index) => new StaggeredTile.count(2, index ==0 ? 2.5 : 3),
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
    );
  }

  Widget itemWidget(int index){
     String imgPath = staggerViewList[index];
     return new Material(
       elevation: 8.0,
       borderRadius: new BorderRadius.all(
         new Radius.circular(8.0),
       ),
       child: new InkWell(
         onTap: () {
           print('点击第${index}个item');
          //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => FullScreenImagePage(imageurl: imgPath)));
         },
         child: Hero(
           tag: imgPath,
           child: Image.network(imgPath,fit: BoxFit.scaleDown,),
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