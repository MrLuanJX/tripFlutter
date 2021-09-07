import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'second.dart';

import 'basic_widgets/index.dart';
import 'list_view/index.dart';
import 'grid_view/index.dart';
import 'custom_icon/index.dart';
import 'sliver_widgets/index.dart';
import 'lb_widgets/index.dart';
import 'lb_tabWidgets/index.dart';
import 'lb_basicWidgets/index.dart';
import 'lb_learnborrow/index.dart';

void main() => runApp(MyApp(route: window.defaultRouteName));

class MyApp extends StatefulWidget {

   String? route;
    MyApp({@required this.route});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
@override
  void initState() {
    super.initState();
    //收到iOS中传入指令
    print(widget.route);
  }  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: HomePage(),
      routes: {
        'basic_widgets': (context) => BasicWidgetsDemo(),
        'list_view': (context) => ListViewDemo(),
        'grid_view': (context) => GridViewDemo(),
        'custom_icons': (context) => CustomIconsDemo(),
        'sliver_widgets': (context) => SliverWidgetsDemo(),
        'lb_widgets' : (context) => LBListDemo(),
        'lb_tabWidgets': (context) => LBTabControllerDemo(),
        'lb_basicWidgets': (context) => LBBasicWidgetsDemo(),
        'lb_learnborrowOrder' : (context) => LBOrderTabControllerDemo(),
      },
    );
  }
}

/// 颜色
const List<Color> COLORS = [
  Color(0xFFFFA400),
  Color(0xFFFF4777),
  Color(0xFFCA6924),
  Color(0xFF00BC12),
  Color(0xFF725E82),
  Color(0xFFDD7160),
  Color(0xFF5D513C),
  Color(0xFFD180D2),
];

/// 例子
const DEMOS = [
  Demo(
    title: '基础组件',
    description: '容器、行、列、文字、图片、图标等最常用组件，是构成界面的基础',
    routeName: 'basic_widgets',
  ),
  Demo(
    title: 'ListView组件',
    description: '滚动型容器列表组件，支持下拉刷新，上拉加载等交互操作',
    routeName: 'list_view',
  ),
  Demo(
    title: 'GridView组件',
    description: '网格布局，支持自定义每行显示的列数以及每一格的宽高比例',
    routeName: 'grid_view',
  ),
  Demo(
    title: '自定义Icon图标',
    description: '下载ttf字体文件，fonts声明，根据unicode码对照生成语义的图标类型',
    routeName: 'custom_icons',
  ),
  Demo(
    title: 'Sliver系列组件',
    description: '自定义高级滚动组件，float、snap、pinned效果任你组合',
    routeName: 'sliver_widgets',
  ),
  Demo(
    title: 'LBListView组件',
    description: '容器、行、列、文字、图片、图标等最常用组件，是构成界面的基础',
    routeName: 'lb_widgets',
  ),
  Demo(
    title: 'LBTabController组件',
    description: '网格布局，支持自定义每行显示的列数以及每一格的宽高比例',
    routeName: 'lb_tabWidgets',
  ),
  Demo(
    title: 'LBBasicWidget',
    description: '',
    routeName: 'lb_basicWidgets',
  ),
  Demo(
    title: 'LearnBorrow',
    description: '订单',
    routeName: 'lb_learnborrowOrder',
  ),
];

class Demo {
  /// 标题
  final String title;
  /// 描述
  final String description;
  /// 路由名
  final String routeName;

  const Demo({
   required this.title,
   required this.description,
   required this.routeName,
  });
}

class _HomePageState extends State<HomePage> {
 //创建消息通道并初始化消息名 这个名字要与iOS对应
 static const MethodChannel methodChannel = MethodChannel('MSGChannel');
  // 注册一个通知,监听原生传给自己的值
 static const EventChannel eventChannel = const EventChannel('MSGEvent');

  @override
  void initState() {
    super.initState();

    //设置消息监听
    methodChannel.setMethodCallHandler((MethodCall call){
      //接收到消息
      print(call.method);
      print(call.arguments);
      return Future.value(true);
    });
  }

@override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Flutter Training'),

         leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios),
              onPressed: () => methodChannel.invokeMethod('dismiss'), 
          // onPressed: () => {
            // Navigator.of(context).pop('刷新')
          // },
        ),
      ),      
      body: GridView.builder(
        itemCount: DEMOS.length,
        padding: EdgeInsets.all(16), 
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.0,
        ),
         itemBuilder: (context, index) {
          return FlatButton(
            onPressed: () => Navigator.pushNamed(context, DEMOS[index].routeName),
            color: COLORS[index % COLORS.length],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      DEMOS[index].title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    DEMOS[index].description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {

 const HomePage({Key? key}): super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

/*
void main() => runApp(MyApp(route: window.defaultRouteName));

class MyApp extends StatefulWidget {
   String? route;
    MyApp({@required this.route});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    //收到iOS中传入指令
    // print(widget.route);
  }  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),

      routes: {
        ///定义 /jump  对应 JumpPage(); 页面
        '/jump':(context)=>SecondPage(),
      }
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}): super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

//创建消息通道并初始化消息名 这个名字要与iOS对应
//  static const MethodChannel methodChannel = MethodChannel('MSGChannel');

  @override
  void initState() {
    super.initState();

    //设置消息监听
    // methodChannel.setMethodCallHandler((MethodCall call){
    //   //接收到消息
    //   print(call.method);
    //   print(call.arguments);
    //   return Future.value(true);
    // });
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('iOS与Flutter通讯'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            //发送消息通过invokeMethod方法
            //  methodChannel.invokeMethod('dismiss');         
            Navigator.pushNamed(context, '/jump');
           },
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 100,
            height: 40,
            child: Text(
              '点击返回iOS',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
*/