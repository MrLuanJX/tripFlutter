import 'package:flutter/material.dart';

import 'service_item.dart';
import 'mock_data.dart';

class ServiceCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return GridView.count(
    //   crossAxisCount: 5,
    //   padding: EdgeInsets.symmetric(vertical: 0),
    //   children: serviceList.map((item) => ServiceItem(data: item)).toList(),
    // );
    
    return Container( 
      // color: Colors.blue,
      // padding: EdgeInsets.all(15),
      child:PhysicalModel(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6)),
        clipBehavior: Clip.antiAlias,
        elevation: 6.0,
        shadowColor: Colors.grey,
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 5,
          children: serviceList.map((item) => ServiceItem(data: item)).toList(),
        ),
      ),
    );
  }
}
