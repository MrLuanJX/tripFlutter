import 'package:flutter/material.dart';

class PetCardViewModel{
  final String coverUrl;
  final String userImgUrl;
  final String userName;
  final String description;
  final String publishTime;
  final String topic;
  final String publishContent;
  final int replies;
  final int likes;
  final int shares;

  const PetCardViewModel({
    required this.coverUrl,
    required this.userImgUrl,
    required this.userName,
    required this.description,
    required this.publishTime,
    required this.topic,
    required this.publishContent,
    required this.replies,
    required this.likes,
    required this.shares,
  });  
}

