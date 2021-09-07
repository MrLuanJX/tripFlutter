import 'package:flutter/material.dart';

class LocalNav extends StatelessWidget {
  final List<LBLocalNavModel> localNavList;

  const LocalNav({
    Key? key,
    required this.localNavList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            spreadRadius: 8,
            color: Colors.black12,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(15,7,15,7),
        child: _items(context),
      ),
    );
  }

  Widget _items(BuildContext context){
    List <Widget> items = [];
    localNavList.forEach((model){
      items.add(_item(context,model));
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items,
    );
  }

  Widget _item(BuildContext context, LBLocalNavModel model){
    return GestureDetector(
      onTap:(){
        print('点击');
      },
      child: Column(
        children: [
          Hero(
            tag: model.icon,
            child: Image.network(
              model.icon,
              fit: BoxFit.scaleDown,
              width: 40,
              height: 40,  
            ),
          ),
          Padding(padding: EdgeInsets.only(top:5)),
          Text(
            model.title,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF333333),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class LBLocalNavModel{
  final String title;
  final String icon;

  const LBLocalNavModel({
    required this.title,
    required this.icon,
  });
}
