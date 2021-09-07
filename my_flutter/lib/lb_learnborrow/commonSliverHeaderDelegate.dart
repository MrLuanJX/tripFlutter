import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui';

class CommonSliverHeaderDelegate extends SliverPersistentHeaderDelegate{
  PreferredSize child;//传入preferredsize组件，因为此组件需要固定高度
  bool islucency;//入参 是否更加滑动变化透明度，true，false
  Color? backgroundColor;//需要设置的背景色
  CommonSliverHeaderDelegate({required this.islucency,required this.child,this.backgroundColor});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {	 
    double mainHeight = maxExtent - shrinkOffset +108;//动态获取滑动剩余高度
    return Container(
      color: backgroundColor??Colors.white,
      child: Opacity(
          opacity:islucency==true&&mainHeight!=maxExtent?((mainHeight / maxExtent)*0.5).clamp(0, 1):1,//根据滑动高度隐藏显示
          child: child
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => this.child.preferredSize.height;
  
  @override
  // TODO: implement minExtent
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }
}