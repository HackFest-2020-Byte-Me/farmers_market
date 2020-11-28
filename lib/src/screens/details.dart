import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appa/src/helpers/styles.dart';

import 'package:flutter_appa/src/models/items.dart';

class Details extends StatefulWidget {
  final Items item;

  Details({@required this.item});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 250,
              child: Stack(
                children: [

                  Carousel(
                    images: [
                      AssetImage('images/${widget.item.image}'),
                      AssetImage('images/${widget.item.image}'),
                      AssetImage('images/${widget.item.image}'),

                    ],
                    dotBgColor: white,
                    dotColor: grey,
                    dotIncreasedColor: red,
                    dotIncreaseSize: 1.2,
                    autoplay: false,

                  ),IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: black,),
                    onPressed: (){Navigator.pop(context);},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
