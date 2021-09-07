import 'package:flutter/material.dart';

import '../grid_view/mock_data.dart';
import '../lb_tabWidgets/lbProgramme.dart';

class LBGuessLikeList extends StatelessWidget {
  Widget lbRenderHeader() {
    return Container(
        padding: EdgeInsets.symmetric(vertical:10, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              '猜你喜欢',
              style: TextStyle(
                fontSize:22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),
            InkWell(
              onTap:(){print('点击更多');},
              child: Container(
                alignment: Alignment.centerRight,
                child: Row(
                  children: <Widget> [
                    Text(
                      '更多',
                      style: TextStyle(
                        fontSize:15,
                        color: Color(0xFF666666),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size:20,
                      color:Color(0xFF999999),
                    ),
                  ],
                ),
              ),                
            ),
          ],
        ),
    );
  }

  Widget lbRenderBody() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: lbProgrammeList.length,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount (
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemBuilder:(context,index){
        return LBProgramme(data: lbProgrammeList[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          this.lbRenderHeader(),
          this.lbRenderBody(),
        ],
      ),
    );
  }
}
