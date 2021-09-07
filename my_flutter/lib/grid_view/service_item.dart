import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  final ServiceItemViewModel data;

  ServiceItem({Key? key, required this.data}) : super(key: key);

  @override
  /*
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(bottom: 5),
      child: Column(
        children: <Widget>[
          Expanded(child: this.data.icon),
          Text(
            this.data.title,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF333333),
            ),
          ),
        ],
      ),
    );
  }*/
   Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //处理点击事件
        print(this.data.title);
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 5),
        child: Column(
          children:<Widget>[
            Expanded(child: this.data.icon),
            Text(
                this.data.title,
                style: TextStyle(
                fontSize: 13,
                color: Color(0xFF333333),
                ),
            ),
          ],
        )
      ),
    );
   }
}

class ServiceItemViewModel {
  /// 图标
  final Icon icon;

  /// 标题
  final String title;

  const ServiceItemViewModel({
   required this.icon,
   required this.title,
  });
}
