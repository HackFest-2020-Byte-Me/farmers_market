import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appa/src/helpers/styles.dart';

import 'package:flutter_appa/src/models/items.dart';
import 'package:flutter_appa/src/widgets/small_button.dart';
import 'package:flutter_appa/src/widgets/textCustomized.dart';

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
                    autoplay: true,

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: black,),
                        onPressed: (){Navigator.pop(context);},
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Stack(
                          children: [
                            Padding(

                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: [
                                  Image.asset("images/shop.png", width: 30, height: 30,),

                                ],
                              ),
                            ),
                            Positioned(
                              left: 5,
                              bottom: 0,
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: white,
                                      borderRadius: BorderRadius.circular(10),
                                          boxShadow: [
                                            BoxShadow(
                                            color: grey,
                                            offset: Offset(2, 1),
                                            blurRadius: 3
                                            )
                                          ]
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 4, right: 4),
                                    child: CustomText(text: "2", color: red, size: 18, weight: FontWeight.bold,),
                                  )),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Positioned(
                   right: 20,
                    bottom: 55,
                    child:  Container(
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: grey[400],
                            offset: Offset(2,1),
                            blurRadius: 3
                          )
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Icon(
                          Icons.favorite,
                          size: 22,
                          color: red,
                        ),
                      ),
                    ),
                  )
                ],

              ),
            ),
            CustomText(text: widget.item.name, size: 26, weight: FontWeight.bold,),
            CustomText(text: "\₱" +  widget.item.price.toString(), size: 20,color: red,  weight: FontWeight.w600,),
            
            SizedBox(
              height: 15,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(icon: Icon(Icons.remove, size: 36,), onPressed: (){}),
                ),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      color: red,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(28, 14, 28, 14),
                      child: CustomText(text: "Add To Eco Bag", color: white, size: 24, weight: FontWeight.w600,),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(icon: Icon(Icons.add, color: red, size: 36,), onPressed: (){}),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
