import 'package:flutter/material.dart';
import '../lb_learnborrow/lb_staggeredGridView.dart';
import '../lb_learnborrow/lb_mine.dart';
import '../lb_learnborrow/gridNav.dart';
import '../lb_learnborrow/lb_tabNavigator.dart';
import '../lb_learnborrow/customStickyWidget.dart';
import '../lb_learnborrow/lbFloatNavigator.dart';
import '../lb_learnborrow/travelTabPage.dart';


final List<Widget> listWidget = [
  MineWidget(),
  StaggerWidget(),
  TabNavigator(),
  StickyDemoWidget(title: 'customStickyWidget'),
  LBFloatNavigator(),
  TravelTabPage(),
];

class ColorGridsWidget extends StatelessWidget {
  const ColorGridsWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     return GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount (
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1 / 1.7,
      ),
  
      children: List.generate(
        Colors.primaries.length,
        (index) =>  InkWell(
            onTap:() {
            print('点击了第${index}个');
              Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => listWidget[index]));  
          },
          child: new Container(
            color:Colors.primaries[index],
          ),
        ),
      ),
    );
  }
}
