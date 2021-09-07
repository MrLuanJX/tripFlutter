import 'package:flutter/material.dart';
import 'gridNavModel.dart';
import '../lb_learnborrow/mock_datas.dart';

class GridNavWidget extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: _gridNavItems(context),
      ),
    );
  }

  List<Widget>_gridNavItems(BuildContext context){
     List<Widget> items = [];
     items.add(_gridNavItem(context, gridNavModel.hotel, true));
     items.add(_gridNavItem(context, gridNavModel.flight, false));
     items.add(_gridNavItem(context, gridNavModel.travel, false));

     return items;
  }

  Widget _gridNavItem(context, gridItemModel,bool isFirst){
    List items = [];
    List<Widget> expandItems = [];
    
    items.add(_mainItem(context, gridItemModel.mainItem));
    items.add(_doubleItem(context, gridItemModel.item1, gridItemModel.item2));
    items.add(_doubleItem(context, gridItemModel.item3, gridItemModel.item4));

    items.forEach((item){
      expandItems.add(
        Expanded(
          child: item,
          flex: 1,
        ),
      );
    });

    return Container(
      height: 88,
      margin: isFirst ? null : EdgeInsets.only(top: 1),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(int.parse('0xff${gridItemModel.startColor}')), Color(int.parse('0xff${gridItemModel.endColor}'))],
        ),
      ),
      child: Row(
        children: expandItems,
      ),
    );
  }

  Widget _mainItem(context, model){
    return _gestureDetector(
      context,
      Stack(
        alignment: AlignmentDirectional.topCenter,
        children:<Widget>[
          Image.network(
          model.icon,
          fit: BoxFit.contain,
          width: 121,
          height: 88,
          alignment: AlignmentDirectional.bottomCenter,
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              model.title,
              style: TextStyle(fontSize: 15,color: Colors.white,),
            ),
          ),
        ],
      ),
      model,
    );
  }

  Widget _doubleItem(context, topModel, bottomModel){
    return Column(
      children: [
        Expanded(
          child:_item(
            context,
            topModel,
            true,
          ),
        ),
        Expanded(
          child:_item(
            context,
            bottomModel,
            false,
          ),
        ),
      ],
    );
  }

  Widget _item(context, model, isFirst){
    BorderSide borderSide = BorderSide(width: 0.8, color: Colors.white);

    return FractionallySizedBox(
      widthFactor: 1,
      child: _gestureDetector(
        context,
        Container(
          decoration: BoxDecoration(
            border: Border(
              left: borderSide,
              bottom: isFirst ? borderSide : BorderSide.none,
            ),
          ),
          child: Center(
            child: Text(
              model.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ),
        model,
      ),
    );
  }

  Widget _gestureDetector(context,widget,model){
    return GestureDetector(
      onTap:(){
        print(model.title);
      },
      child: widget,
    ); 
  }
}


