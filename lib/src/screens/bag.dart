import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appa/src/helpers/styles.dart';
import 'package:flutter_appa/src/models/items.dart';
import 'package:flutter_appa/src/widgets/textCustomized.dart';

class Ecobag extends StatefulWidget {
  @override
  _EcobagState createState() => _EcobagState();
}

class _EcobagState extends State<Ecobag> {
  Items item = Items(name: "Garlic",  price: 12.99, rating: 4.2, vendor: "Mang Oka's Farm", wishList: false, image: "crop_garlic.png");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: black,), onPressed: (){}),
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: CustomText(text: "Eco Bag",),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Image.asset("images/shop.png", width: 35, height: 35,),
                ),

                Positioned(
                  left: 7,
                  bottom: 5,
                  child: Container(
                      decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: grey[400],
                                offset: Offset(2, 1),
                                blurRadius: 3
                            )
                          ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: CustomText(text: "2", color: red, size: 16, weight: FontWeight.bold,),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 180,

              decoration: BoxDecoration(
                color: white,
                boxShadow:[
                  BoxShadow(
                    color: red[50],
                    offset: Offset(3,5),
                    blurRadius: 30
                  )
                ]
              ),
              child: Row(
                children: [
                  Image.asset(
                    "images/${item.image}",
                    height: 120,
                    width: 120,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(text: TextSpan(children: [
                        TextSpan(text: item.name + "\n", style: TextStyle(color: black, fontSize: 20) ),
                        TextSpan(text: "\₱" + item.price.toString() + "\n", style: TextStyle(color: black, fontSize: 17, fontWeight: FontWeight.bold ) ),
                      ])),

                      SizedBox(
                        width: 100,

                      ),
                      IconButton(icon: Icon(Icons.delete), ),
                    ],
                  )
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}
