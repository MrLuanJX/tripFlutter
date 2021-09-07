import 'package:flutter/material.dart';
import '../lb_widgets/petCardModel.dart';

class LBPetCardWidget extends StatelessWidget{
  final PetCardViewModel petModel;

  const LBPetCardWidget({Key? key, required this.petModel,}): super(key: key);

  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            spreadRadius: 4,
            color: Color.fromARGB(20, 0, 0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          this.lbRenderCover(),
          this.lbRenderUseInfo(),
          this.lbRenderPublishContext(),
          this.lbRenderInteractionArea(),
        ],
      ),
    );
  }
  // 图片
  Widget lbRenderCover(){
    return Stack(
      fit: StackFit.passthrough,
      children: <Widget>[
        ClipRRect(
          borderRadius:BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          child: Image.network(
            petModel.coverUrl,
            height: 200,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
          left:0,
          top:100,
          right:0,
          bottom:0,
          child:Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(0, 0, 0, 0),
                  Color.fromARGB(80, 0, 0, 0),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
  // 用户信息
  Widget lbRenderUseInfo() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment:CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                radius:20,
                backgroundColor: Color(0xFFCCCCCC),
                backgroundImage: NetworkImage(petModel.userImgUrl),
              ),
              Padding(padding: EdgeInsets.only(left:8)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    petModel.userName,
                    style: TextStyle(
                      fontSize:15,
                      fontWeight: FontWeight.bold,
                      color:Color(0xFF333333),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top:2)),
                  Text(
                    petModel.description,
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF999999),
                    ),
                  )
                ],
             ),
            ],
          ),
          Text(
            petModel.publishTime,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF999999),
            ),
          ),
        ],
      ),
    );
  }
  // context
  Widget lbRenderPublishContext() {
    return Container(
      margin: EdgeInsets.only(top:16),
      padding: EdgeInsets.symmetric(horizontal:16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Container(
            margin: EdgeInsets.only(bottom: 14),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Color(0xFFFFC600),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: Text(
             '# ${petModel.topic}',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            petModel.publishContent,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF333333),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
  // Area
  Widget lbRenderInteractionArea() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.message,
                size: 16,
                color: Color(0xFF999999),
              ),
              Padding(padding: EdgeInsets.only(left: 6)),
              Text(
                petModel.replies.toString(),
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF999999),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.favorite,
                size: 16,
                color: Color(0xFFFFC600),
              ),
              Padding(padding: EdgeInsets.only(left: 6)),
              Text(
                petModel.likes.toString(),
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF999999),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.share,
                size: 16,
                color: Color(0xFF999999),
              ),
              Padding(padding: EdgeInsets.only(left: 6)),
              Text(
                petModel.shares.toString(),
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF999999),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


