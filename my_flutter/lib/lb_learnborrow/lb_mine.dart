import 'package:flutter/material.dart';
import '../lb_learnborrow/mine_mock_data.dart';
import '../lb_learnborrow/travel_model.dart';
import '../lb_learnborrow/travel_tab_model.dart';

import 'package:dio/dio.dart';


const TRAVEL_URL =
    'https://m.ctrip.com/restapi/soa2/16189/json/searchTripShootListForHomePageV2?_fxpcqlniredt=09031010211161114530&__gw_appid=99999999&__gw_ver=1.0&__gw_from=10650013707&__gw_platform=H5';
const PAGE_SIZE = 10;

var params = {
  "districtId": -1,
  "groupChannelCode": "tourphoto_global1",
  "type": null,
  "lat": 34.2317081,
  "lon": 108.928918,
  "locatedDistrictId": 7,
  "pagePara": {
    "pageIndex": 1,
    "pageSize": 10,
    "sortType": 9,
    "sortDirection": 0
  },
  "imageCutType": 1,
  "head": {
    "cid": "09031010211161114530",
    "ctok": "",
    "cver": "1.0",
    "lang": "01",
    "sid": "8888",
    "syscode": "09",
    "auth": null,
    "extension": [
      {"name": "protocal", "value": "https"}
    ]
  },
  "contentType": "json"
};

/// 旅拍类别接口
class TravelDao {
  static Future<TravelModel> fetch(
    String url,
    Map params,
    String groupChannelCode,
    int type,
    int pageIndex,
    int pageSize,
  ) async {
    Map paramsMap = params['pagePara'];
    paramsMap['pageIndex'] = pageIndex;
    paramsMap['pageSize'] = pageSize;
    params['groupChannelCode'] = groupChannelCode;
    params['type'] = type;

    Response response = await Dio().post(url, data: params);

    if (response.statusCode == 200) {
		print('data: ${response.data}');
      return TravelModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load travel_page.json');
    }
  }
}

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

class MineWidget extends StatefulWidget {
	@override
	_MineWidgetState createState() => _MineWidgetState();
}

class _MineWidgetState extends State<MineWidget> {
		//初始化tab数据
  Future _loadData() async {
    // _controller = TabController(length: 0, vsync: this);
    try {
      TravelTabModel model = await TravelTabDao.fetch();
	  print('model---${model}');
    //   _controller = TabController(
    //       length: model.tabs.length, vsync: this); // fix tab label 空白问题
      setState(() {
        // tabs = model.tabs;
        // travelTabModel = model;
      });
    } catch (e) {
      print(e);
    }
  }

	@override
	Widget build(BuildContext context) {
		return Scaffold(
      		appBar: AppBar(
				title: Text('我的'),
			),
			body: CustomScrollView(
				slivers: <Widget>[
					SliverPadding(
						padding:EdgeInsets.all(10),
						sliver: SliverToBoxAdapter(
							child: GestureDetector(
								child:Container(
      								margin: EdgeInsets.fromLTRB(16, 30, 16, 50),
									decoration: BoxDecoration(
        								color: Colors.white,
        								borderRadius: BorderRadius.circular(8),
        								boxShadow: [
          									BoxShadow(
            									blurRadius: 8,
            									spreadRadius: 8,
            									color: Color(0xFFD0D0D0),
          									),
        								],
      								),
									child: Material(
										child: InkWell(
											onTap:(){_loadData();},
											child: Padding(
												padding: EdgeInsets.fromLTRB(30,50,16,50),
												child: Row(
        											mainAxisAlignment: MainAxisAlignment.spaceBetween,
													children: <Widget>[
														Row(
															children: <Widget>[
																CircleAvatar(
																	radius: 30,
																	backgroundImage: NetworkImage(mineModel.userImgUrl),
																),
																Padding(padding: EdgeInsets.only(left: 15)),
																Column(
																	crossAxisAlignment: CrossAxisAlignment.start,
																	children: <Widget>[
																		Text(
																			'${mineModel.userName}',
																			style: TextStyle(
																			fontSize: 18,
																			fontWeight:FontWeight.bold,
																			color: Color(0xFF130202),
																			),
																		textAlign: TextAlign.left,
																		),
																		Padding(padding: EdgeInsets.only(top: 10)),
																		Text(
																			'${mineModel.telphoneNumber}',
																			style: TextStyle(
																			fontSize: 14,
																			color: Color(0xFF666666),
																			),
																		),
																	],
																),
															],
														),
														Icon(Icons.arrow_forward_ios,color:Color(0xFFD0D0D0)),
													],
												),
											),
										),
									),
								),
							),
						),
					),
					// 当列表项高度固定时，使用 SliverFixedExtendList 比 SliverList 具有更高的性能
          			SliverFixedExtentList(
            			delegate: SliverChildBuilderDelegate(
              				(context, index) {
							return Material(
							  	child: InkWell(
									onTap:(){
										// print("点击到第"+index.toString());
										_loadListData();
									},
								 	child: Container(
								  		child: Column(
									  		crossAxisAlignment: CrossAxisAlignment.start,
									  		children: <Widget> [
												Container(
													height: 79,
													child: Padding(
														padding: EdgeInsets.fromLTRB(15,20,15,20),
														child: Row(
															mainAxisAlignment: MainAxisAlignment.spaceBetween,
															children: <Widget>[
																Row(
																	children: <Widget>[
																		cellIcons[index],
																		Padding(padding: EdgeInsets.only(left: 10)),
																		Text(
																			'${mineModel.cellModels[index].name}',
																			style: TextStyle(
																				fontSize: 14,
																				color: Color(0xFF666666),
																			),
																		),
																	],
																),
																Icon(Icons.arrow_forward_ios,color:Color(0xFFD0D0D0)),
															],
														),
													),
									  			),
												Container(
													padding:EdgeInsets.fromLTRB(15,0,15,0),
													child: Divider(height: 1, color: Color(0xFF9C9C9C)),
												),
									  		],
								  		),
								  	),
								  ),
							  	);
							},
							childCount: mineModel.cellModels.length,
						),
						itemExtent: 80,
					),
				],
			),
		);
	}
	// 获取数据
  void _loadListData() async {
	int pageIndex = 1;
    try {
      TravelModel model = await TravelDao.fetch(TRAVEL_URL, params,
          "tourphoto_global1",1, pageIndex, PAGE_SIZE);
      setState(() {
        print(model.totalCount);
        // List<TravelItem> items = _filterItems(model.resultList);
        // if (travelItems != null) {
        //   travelItems!.addAll(items);
        // } else {
        //   travelItems = items;
        // }
      });
    } catch (e) {
      print(e);
    }
  }
}

class LBMineModel {
 	final String userImgUrl;
 	final String userName;
	final String telphoneNumber;
 	final List<CellModel>cellModels;	

 	const LBMineModel({
	 	required this.userImgUrl,
	 	required this.userName,
		required this.telphoneNumber,
		required this.cellModels,
 	});
}

class CellModel{
	final String icon;
	final String name;

	const CellModel ({
		required this.icon,
		required this.name,
	});
}

final List<Icon> cellIcons = [
	Icon(Icons.phone_in_talk,color: Color(0xFFFF8247)),
	Icon(Icons.domain,color: Color(0xFFFF8247)),
	Icon(Icons.person_outline,color: Color(0xFFFF8247)),
	Icon(Icons.dialpad,color: Color(0xFFFF8247)),
];
