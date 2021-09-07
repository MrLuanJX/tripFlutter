import 'package:flutter/material.dart';

class SubNav extends StatelessWidget {
  final List<LBSubNavModel> subNavList;

  const SubNav({
    Key? key,
    required this.subNavList,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.all(7),
        child: _items(context),
      ),
    );
  }

  Widget _items(context) {
    List <Widget> items = [];

    subNavList.forEach((model){
      items.add(_item(context, model));
    });

    int separate = (subNavList.length/2 + 0.5).toInt();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.sublist(0 , separate),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items.sublist(separate, subNavList.length),
          ),
        ),
      ],
    );
  }

  Widget _item(context, model) {
    return Expanded(
      child: InkWell(
        onTap:() {
          print(model.title);
        },
        child: Column(
          children: [
            Image.network(
              model.icon,
              fit: BoxFit.cover,
              width: 18,
              height: 18,
            ),
            Padding(
              padding: EdgeInsets.only(top: 7),
              child: Text(
                model.title,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF130202),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LBSubNavModel{
  final String title;
  final String icon;
  final String url;
  final bool hideAppBar;

  const LBSubNavModel({
    required this.title,
    required this.icon,
    required this.url,
    required this.hideAppBar,
  });
}