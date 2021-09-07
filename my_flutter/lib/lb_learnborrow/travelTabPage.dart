import 'package:flutter/material.dart';
import '../lb_learnborrow/travel_model.dart';
import '../lb_learnborrow/travel_tab_model.dart';
import '../lb_learnborrow/travelPage.dart';
import 'package:dio/dio.dart';

const TRAVEL_TAB_URL =
    'https://apk-1256738511.cos.ap-chengdu.myqcloud.com/FlutterTrip/data/travel_page.json';

/// 旅拍类别接口
class TravelTabDao {
  static Future<TravelTabModel> fetch() async {
    Response response = await Dio().get(TRAVEL_TAB_URL);
    if (response.statusCode == 200) {
      return TravelTabModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load travel_page.json');
    }
  }
}

class TravelTabPage extends StatefulWidget {
	const TravelTabPage({Key? key}) : super(key: key);

	@override
	_TravelTabPageState createState() => _TravelTabPageState();
}

class _TravelTabPageState extends State<TravelTabPage> with TickerProviderStateMixin{
	late TabController _controller;
	List <TravelTab>tabs = [];
	TravelTabModel? travelTabModel;

	@override
	void initState() {
		super.initState();
		_loadData();
	}

	@override
	void dispose() {
		_controller.dispose();
		super.dispose();
	}

	void _loadData() async {
		_controller = TabController(length: 0,vsync: this);
		try{
			TravelTabModel model = await TravelTabDao.fetch();
			_controller = TabController(length: model.tabs.length, vsync: this);
			setState((){
				tabs = model.tabs;
				travelTabModel = model;
			});
		}catch(e){
			print('error: ${e}');
		}
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Column(
				children: <Widget>[
					Container(
						color: Colors.white,
						padding: EdgeInsets.only(top: 30),
						child: TabBar(
							controller: _controller,
							isScrollable: true,
							labelColor: Colors.black,
							labelPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
							indicator: UnderlineTabIndicator(
								borderSide: BorderSide(color: Color(0xff1fcfbb),width: 3),
								insets: EdgeInsets.only(bottom: 10),
							),
							tabs: tabs.map<Tab>(
								(TravelTab tab) {
									return Tab(
										text: tab.labelName,
									);
								}
							).toList(),
						),
					),
					Flexible(
						child: TabBarView(
							controller: _controller,
							children: tabs.map((TravelTab tab){
									return TravelPage(
										travelUrl: travelTabModel!.url,
										params: travelTabModel!.params,
										groupChannelCode: tab.groupChannelCode,
										type: tab.type,
									);
								}
							).toList(),
						),
					),
				],
			),
		);
	}
}