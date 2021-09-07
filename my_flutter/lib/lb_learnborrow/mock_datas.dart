import 'orderCell.dart';
import 'localNav.dart';
import 'gridNav.dart';
import 'gridNavModel.dart';
import 'subNav.dart';
import 'salesBox.dart';
import 'salesBoxModel.dart';

/// LBGridNavModel
const LBSalesBoxModel salesBoxModel = LBSalesBoxModel(
	icon: 'https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/sales_box_huodong.png',
	moreUrl: 'https://contents.ctrip.com/activitysetupapp/mkt/index/moreact',
	bigCard1: BigCard1(
		icon: 'https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/700t0y000000m71h523FE_375_260_342.png',
		url: "https://contents.ctrip.com/buildingblocksweb/special/membershipcard/index.html?sceneid=1&productid=14912&ishidenavbar=yes&pushcode=act_svip_hm31",
      	title: "活动",
	),
	bigCard2: BigCard2(
		icon: 'https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/700a10000000portu2BAD_375_260_342.jpg',
		url: "https://m.ctrip.com/webapp/you/livestream/plan/crhHotelList.html?liveAwaken=true&isHideHeader=true&isHideNavBar=YES&mktcrhcode=hotevent",
      	title: "活动",
	),
	smallCard1: SmallCard1(
		icon: "https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/700b0z000000neoth8688_375_160_345.jpg",
      	url: "https://contents.ctrip.com/activitysetupapp/mkt/index/nbaafs?pushcode=IP_nbaafs004",
      	title: "活动",
	),
	smallCard2: SmallCard2(
      	icon: "https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/700w0z000000mogkyEF78_375_160_345.jpg",
      	url: "https://smarket.ctrip.com/webapp/promocode/add?source=5",
      	title: "活动",
	),
    smallCard3: SmallCard3(
      	icon: "https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/700a0t000000im512AB2C_375_160_345.jpg",
      	url: "https://smarket.ctrip.com/webapp/promocode/add?source=5",
      	title: "活动",
	),
    smallCard4: SmallCard4(
      	icon: "https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/700d0s000000htvwo16C4_375_160_345.jpg",
      	url: "https://smarket.ctrip.com/webapp/promocode/add?source=5",
      	title: "活动",
	),
);

/// LBSubNavModel
const List<LBSubNavModel> subNavList = [
	LBSubNavModel(
 		icon: "https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/sub_nav_wifi.png",
      	title: "WiFi电话卡",
      	url: "https://m.ctrip.com/webapp/activity/wifi",
      	hideAppBar: true,
	),
	LBSubNavModel(
 		icon: "https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/sub_nav_visa.png",
      	title: "保险·签证",
      	url: "https://m.ctrip.com/webapp/tourvisa/entry",
      	hideAppBar: true,
	),
	LBSubNavModel(
 		icon: "https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/sub_nav_exchange.png",
      	title: "外币兑换",
      	url: "https://dp.ctrip.com/webapp/forex/index?bid=2&1=1",
      	hideAppBar: true,
	),
	LBSubNavModel(
 		icon: "https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/sub_nav_shopping.png",
      	title: "购物",
      	url: "https://m.ctrip.com/webapp/gshop/?ctm_ref=M_ps_2home_sl&bid=2&cid=3&pid=1",
      	hideAppBar: true,
	),
	LBSubNavModel(
 		icon: "https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/sub_nav_guide.png",
      	title: "当地向导",
      	url: "https://m.ctrip.com/webapp/vacations/pguider/homepage?secondwakeup=true&dpclickjump=true&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
      	hideAppBar: true,
	),
	LBSubNavModel(
 		icon: "https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/sub_nav_freetravel.png",
      	title: "自由行",
      	url: "https://dp.ctrip.com/webapp/vacations/idiytour/diyindex?navBarStyle=white",
      	hideAppBar: true,
	),
	LBSubNavModel(
 		icon: "https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/sub_nav_play.png",
      	title: "境外玩乐",
      	url: "https://dp.ctrip.com/webapp/activity/overseasindex",
      	hideAppBar: true,
	),
	LBSubNavModel(
 		icon: "https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/sub_nav_lipin.png",
      	title: "礼品卡",
      	url: "https://dp.ctrip.com/webapp/lipin/money",
      	hideAppBar: true,
	),
	LBSubNavModel(
 		icon: "https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/sub_nav_credit.png",
      	title: "信用卡",
      	url: "https://dp.ctrip.com/webapp/cc/index?bid=8&cid=1&pid=4",
      	hideAppBar: true,
	),
	LBSubNavModel(
 		icon: "https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/sub_nav_more.png",
      	title: "更多",
      	url: "https://dp.ctrip.com/webapp/more/",
      	hideAppBar: true,
	),
];

/// LBGridNavModel
const LBGridNavModel gridNavModel = LBGridNavModel(
	hotel: LBHotelModel(
		startColor: 'fa5956',
		endColor: 'fa9b4d',
		mainItem: LBHotelMainItem(
			title: "酒店",
        	icon: "https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/grid-nav-items-hotel.png",
        	url: "https://m.ctrip.com/webapp/hotel/",
        	statusBarColor: "4289ff",
			hideAppBar: 'false',
		),
		item1: HotelItem1(
			title: "海外酒店",
        	icon: "",
        	url: "https://m.ctrip.com/webapp/hotel/oversea/?otype=1",
        	statusBarColor: "4289ff",
			hideAppBar: 'false',
		),
		item2: HotelItem2(
			title: "特价酒店",
        	icon: "",
        	url: "https://m.ctrip.com/webapp/hotel/hotsale",
        	statusBarColor: "",
			hideAppBar: 'false',
		),
		item3: HotelItem3(
			title: "团购",
        	icon: "",
        	url: "https://m.ctrip.com/webapp/tuan/?secondwakeup=true&dpclickjump=true",
        	statusBarColor: "",
			hideAppBar: 'true',
		),
		item4: HotelItem4(
			title: "民宿 客栈",
        	icon: "",
        	url: "https://m.ctrip.com/webapp/inn/index",
        	statusBarColor: "",
			hideAppBar: 'true',
		),
	),
	flight: LBFlightModel(
		startColor: '4b8fed',
		endColor: '53bced',
		mainItem: LBFlightMainItem(
			title: "机票",
        	icon: "https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/grid-nav-items-flight.png",
        	url: "https://m.ctrip.com/html5/flight/swift/index",
        	statusBarColor: "",
			hideAppBar: 'false',
		),
		item1: FlightItem1(
			title: "火车票",
        	icon: "",
        	url: "https://m.ctrip.com/webapp/train/?secondwakeup=true&dpclickjump=true&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F#/index?VNK=4e431539",
        	statusBarColor: "",
			hideAppBar: 'true',
		),
		item2: FlightItem2(
			title: "特价机票",
        	icon: "",
        	url: "https://m.ctrip.com/html5/flight/swift/index",
        	statusBarColor: "",
			hideAppBar: 'false',
		),
		item3: FlightItem3(
			title: "汽车票·船票",
        	icon: "",
        	url: "https://m.ctrip.com/html5/Trains/bus/",
        	statusBarColor: "",
			hideAppBar: 'true',
		),
		item4: FlightItem4(
			title: "专车·租车",
        	icon: "",
        	url: "https://m.ctrip.com/webapp/car/index?s=ctrip&from=https%3A%2F%2Fm.ctrip.com%2Fhtml5%2F",
        	statusBarColor: "",
			hideAppBar: 'true',
		),
	),
	travel: LBTravelModel(
		startColor: '34c2aa',
		endColor: '6cd557',
		mainItem: LBTravelMainItem(
			title: "旅游",
        	icon: "https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/grid-nav-items-travel.png",
        	url: "https://m.ctrip.com/webapp/vacations/tour/vacations",
        	statusBarColor: "19A0F0",
			hideAppBar: 'true',
		),
		item1: TravelItem1(
			title: "门票",
        	icon: "",
        	url: "https://m.ctrip.com/webapp/ticket/ticket",
        	statusBarColor: "19A0F0",
			hideAppBar: 'true',
		),
		item2: TravelItem2(
			title: "目的地攻略",
        	icon: "",
        	url: "https://m.ctrip.com/html5/you/",
        	statusBarColor: "19A0F0",
			hideAppBar: 'true',
		),
		item3: TravelItem3(
			title: "邮轮旅行",
        	icon: "",
        	url: "https://m.ctrip.com/webapp/cruise/index",
        	statusBarColor: "",
			hideAppBar: 'true',
		),
		item4: TravelItem4(
			title: "定制旅行",
        	icon: "",
        	url: "https://m.ctrip.com/webapp/dingzhi",
        	statusBarColor: "",
			hideAppBar: 'true',
		),
	),
);

/// LBLocalNavModel
const List<LBLocalNavModel> localNavList = [
	LBLocalNavModel(
		title:  '景点·玩乐',
		icon: 'https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/ln_ticket.png',
	),
	LBLocalNavModel(
		title: '周边游',
		icon: 'https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/ln_weekend.png',
	),
	LBLocalNavModel(
		title:    '美食林',
		icon:     'https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/ln_food.png',
	),
	LBLocalNavModel(
		title:   '一日游',
		icon:    'https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/ln_oneday.png',
	),
	LBLocalNavModel(
		title:  '当地攻略',
		icon:   'https://apk-1256738511.file.myqcloud.com/FlutterTrip/images/ln_guide.png',
	),
];


/// 订单列表
const List<LBOrderViewModel> orderList = [
	LBOrderViewModel(
		orderType: 1,
		orderTypeUrl: 'http://wx.qlogo.cn/mmhead/ver_1/ZlEUgMmdukDlDjnIRjqBCSJNBtjWpocqGKGjpA9ImBkictzNPJCllxKXk3iaJ1qHZE8xQNarsH13kPDxDwLfLO3bly9tRKxweAX6ycibpoJENY/132',
		schoolName: '校区名称1',
		className: '课程名称1',
		loanMoney: 28000,
		repaymentType: '到期一次性还款',
		applyTime: '2018-01-01 11:12:13',
		cardNumber: '7890',
		bankName: '中国银行',
	),
	LBOrderViewModel(
		orderType: 2,
		orderTypeUrl: 'http://wx.qlogo.cn/mmhead/ver_1/lAMlzCkVacwSrl7nlgP7ye93rVa1ibDyeNTT1CnIianT2f1zoTWVylIHiaG8NZEc4Cmrm4b6OibHqu1RxZRaqXGJadOXUmI3zRMU2lkDvFmIs8U/132',
		schoolName: '校区名称2',
		className: '课程名称2',
		loanMoney: 32840,
		repaymentType: '9期等额还本',
		applyTime: '2020-04-23 15:16:33',
		cardNumber: '8800',
		bankName: '建设银行',
	),
	LBOrderViewModel(
		orderType: 3,
		orderTypeUrl: 'http://wx.qlogo.cn/mmhead/ver_1/cCicCOP5a9icPAkmEW6h6onGqicAbPmhibYq1VhtK0ws2teiaQmO7CcibFibTVeJdJEUZZ2kicXH7yZuwTnBibUUqfxPMZribq31Wq9cSvp4Nwasp6T4E/132',
		schoolName: '校区名称3',
		className: '课程名称3',
		loanMoney: 56200,
		repaymentType: '18期前高后低',
		applyTime: '2021-01-01 16:33:21',
		cardNumber: '3341',
		bankName: '工商银行',
	),
	LBOrderViewModel(
		orderType: 4,
		orderTypeUrl: 'http://wx.qlogo.cn/mmhead/ver_1/Yp0beDghkpibRaU5xI4JkWfBK9fWddSdicIqCOaWJT23cQapfsV5iaER5KMIut1Mcs7Ay5dQw5XhdU78tZ0dNFEuAsOI7sNHFGicMzTfqLh5BRw/132',
		schoolName: '校区名称4',
		className: '课程名称4',
		loanMoney: 2200,
		repaymentType: '9期等额还本',
		applyTime: '2019-12-01 13:13:13',
		cardNumber: '8940',
		bankName: '农业银行',
	),
];
