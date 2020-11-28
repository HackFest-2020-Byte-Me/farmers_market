import 'package:flutter/material.dart';
import 'package:flutter_appa/src/helpers/screen_navigation.dart';
import 'package:flutter_appa/src/models/items.dart';
import 'package:flutter_appa/src/screens/details.dart';
import 'package:flutter_appa/src/widgets/textCustomized.dart';

import '../helpers/styles.dart';

List<Items> itemsList = [
  Items(name: "Garlic",  price: 12.99, rating: 4.2, vendor: "Mang Oka's Farm", wishList: false, image: "crop_garlic.png"),
  Items(name: "Ginger",  price: 12.99, rating: 4.2, vendor: "Mang Oka's Farm", wishList: true, image: "crop_ginger.png"),
  Items(name: "Onion",  price: 12.99, rating: 4.2, vendor: "Mang Oka's Farm", wishList: false, image: "crop_onion.png"),
  Items(name: "Potato",  price: 12.99, rating: 4.2, vendor: "Mang Oka's Farm", wishList: true, image: "crop_potato.png"),
  Items(name: "Egg Salted",  price: 12.99, rating: 4.2, vendor: "Mang Oka's Farm", wishList: false, image: "egg_salted.png"),
  Items(name: "Apple",  price: 12.99, rating: 4.2, vendor: "Mang Oka's Farm", wishList: true, image: "fruit_apple.png"),

];

class Featured extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: itemsList.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(12, 14, 16, 12),
              child: GestureDetector(
                onTap: (){
                  changeScreen(_, Details(item: itemsList[index],));
                },
                child: Container(
                  height: 220,
                  width: 200,
                  decoration: BoxDecoration(color: white, boxShadow: [
                    BoxShadow(
                        color: grey[50],
                        offset: Offset(15, 5),
                        blurRadius: 30)
                  ]),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        "images/${itemsList[index].image}",
                        height: 140,
                        width: 140,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomText(
                              text: itemsList[index].name,
                            ),
                          ),


                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: grey[300],
                                        offset: Offset(1, 1),
                                        blurRadius: 4)
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child:  (itemsList[index].wishList == false) ? Icon(
                                  Icons.favorite_border,
                                  color: red,
                                  size: 18,
                                ) : Icon(
                                  Icons.favorite,
                                  color: red,
                                  size: 18,
                                ),//
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: CustomText(text: itemsList[index].rating.toString(),
                                  color: grey,
                                  size: 14,),
                              ),
                              SizedBox(width: 2),
                              Icon(Icons.star, color: red, size: 16, ),
                              Icon(Icons.star, color: red, size: 16, ),
                              Icon(Icons.star, color: red, size: 16, ),
                              Icon(Icons.star, color: red, size: 16, ),
                              Icon(Icons.star, color: grey, size: 16, ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: CustomText(text: "\₱${itemsList[index].price}", weight:  FontWeight.bold,),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
