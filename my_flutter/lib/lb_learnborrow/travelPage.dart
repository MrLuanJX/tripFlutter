import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../lb_learnborrow/travel_model.dart';
import '../lb_learnborrow/travel_tab_model.dart';
import '../lb_learnborrow/loading_container.dart';
import '../utils/navigator_util.dart';
import 'package:dio/dio.dart';
import 'dart:async';

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
      print(response.data);
      return TravelModel.fromJson(response.data);
    } else {
      throw Exception('Failed to load travel_page.json');
    }
  }
}

class TravelPage extends StatefulWidget{
  final String travelUrl;
  final Map params;
  final String groupChannelCode;
  final int type;

  const TravelPage({
    Key? key, 
    required this.travelUrl, 
    required this.params, 
    required this.groupChannelCode, 
    required this.type,
    }) : super(key: key);

  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> with AutomaticKeepAliveClientMixin {
    List<TravelItem>? travelItems;
    int pageIndex = 1;
    bool _loading = true;
    ScrollController _scrollController = ScrollController();

    // 缓存页面
    @override 
    bool get wantKeepAlive => true;

    @override
    void initState(){
      super.initState();
      _loadData();
      _scrollController.addListener((){
          if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
            _loadData(loadMore: true);
          }
      });
    }

    @override
    void dispose(){
      _scrollController.dispose();
      super.dispose();
    }

    void _loadData({loadMore = false}) async {
        if (loadMore) {
          pageIndex++;
        } else {
          pageIndex = 1;
        }
      try{
        TravelModel model = await TravelDao.fetch(widget.travelUrl, widget.params, widget.groupChannelCode, widget.type,pageIndex, PAGE_SIZE);
        setState((){
          print(model.totalCount);
          List<TravelItem>items = _filterItems(model.resultList);
          if(travelItems != null){
            travelItems!.addAll(items);
          } else {
            travelItems = items;
          }
          _loading = false;
        });
      } catch(e) {
        print(e);
        setState(() {
          _loading = false;
        });
      }
    }

    // 下拉刷新
    Future _handleRefresh() async {
      _loadData();
    } 

    // 数据过滤
    List<TravelItem> _filterItems(List<TravelItem>? resultList) {
      if(resultList == null)  return [];

      List<TravelItem> filterItems = [];
      resultList.forEach((item){
        filterItems.add(item);
      });
      return filterItems;
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: LoadingContainer(
          isLoading: _loading,
          child: RefreshIndicator(
            onRefresh: _handleRefresh,
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: StaggeredGridView.countBuilder(
                controller: _scrollController,
                crossAxisCount: 2,
                itemCount: travelItems?.length ?? 0,
                itemBuilder: (BuildContext context, int index) => 
                _TravelItem(index: index , item: travelItems![index]),
                staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
              ),
            ),
          ), 
        ),
      );
    }
}

class _TravelItem extends StatelessWidget {
  final TravelItem item;
  final int index;

  const _TravelItem({Key? key, required this.item, required this.index,}): super(key: key);

  String _poiName() {
    return item.article.pois.length == 0 ? '未知': item.article.pois[0].poiName;
  }

  Widget get _itemImage {
    return Stack(
      children: [
        Image.network(
           item.article.images[0].dynamicUrl
        ),
      Positioned(
        bottom: 8,
        left: 8,
        child: Container(
          padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 3),
                child: Icon(
                  Icons.location_on,
                  color: Colors.white,
                  size: 12,
                ),
              ),
              LimitedBox(
                maxWidth: 130,
                child: Text(
                  _poiName(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12, color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      ],
    );
  }

  Widget get _infoText {
    return Container(
      padding: EdgeInsets.fromLTRB(6, 0, 6, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              PhysicalModel(
                color: Colors.transparent,
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  item.article.author.coverImage.dynamicUrl,
                  width: 24,
                  height: 24,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                width: 90,
                child: Text(
                  item.article.author.nickName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.thumb_up,
                size: 14,
                color: Colors.grey,
              ),
              Padding(
                padding: EdgeInsets.only(left: 3),
                child: Text(
                  item.article.likeCount.toString(),
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(item.article.urls.length > 0) {
          print('跳转详情');
        }
      },
      child: Card(
        child: PhysicalModel(
          color: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _itemImage,
              Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  item.article.articleTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ),
              _infoText,
            ],
          ),
        ),
      ),
    );
  }
}
