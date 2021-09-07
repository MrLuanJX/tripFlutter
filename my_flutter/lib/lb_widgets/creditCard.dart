import 'package:flutter/material.dart';
import '../lb_widgets/creditCardModel.dart';

class CreditCardWidget extends StatelessWidget {
  final CreditCardViewModel data;

  const CreditCardWidget ({Key? key, required this.data}): super(key:key);

  @override
  Widget build(BuildContext context){
    return Container(
      height: 180,
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      padding: EdgeInsets.only(left: 20, top: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: this.data.cardColors,
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            spreadRadius: 4,
            color: Color.fromARGB(20, 0, 0, 0),
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0, top: 0, right: 0, bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        this.data.bankLogoUrl,
                        height:250,
                        width: 250,
                        color: Colors.white10,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 15)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          this.data.bankName,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 5)),
                        Text(
                          this.data.cardType,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 20, left: 65),
                  child: Text(
                    this.data.cardNumber,
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 3,
                      fontFamily: 'Farrington',
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 15, left: 65),
                  child: Text(
                    this.data.validDate,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  } 
}
