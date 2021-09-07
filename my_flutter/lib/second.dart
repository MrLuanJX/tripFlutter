import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> { 

  @override
  void initState() {
    super.initState();
  }

   @override
  Widget build(BuildContext context) {
    /*
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondPage'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            //发送消息通过invokeMethod方法
            //  methodChannel.invokeMethod('dismiss');
          },
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 100,
            height: 40,
            child: Text(
              '点击返回iOS',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
    */
    return Scaffold(
      body: SliverAppBar(
        pinned: true,
        expandedHeight: 250,
        elevation: 0,
        flexibleSpace: FlexibleSpaceBar(
          title: Text('SecondPage'),
          background: Image.network(
            'http://img1.mukewang.com/5c18cf540001ac8206000338.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}




