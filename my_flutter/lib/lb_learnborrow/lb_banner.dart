import 'dart:ui';
import 'package:flutter/material.dart';
// import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../lb_learnborrow/cached_image.dart';

class LBBannerWidget extends StatelessWidget{

  Widget build(BuildContext context){
    return Container(
      height: 160,
      child: Swiper(
        autoplay: true,
        loop: true,
        pagination: SwiperPagination(),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index){
          return CachedImage (
           imageUrl: '',
           fit: BoxFit.fill,
          );
        },
      ),
    );
  }
}

// class CommonModel{
//   final String url;
//   final String icon;

//   const CommonModel({
//     required this.icon,
//     required this.url,
//   });
// }