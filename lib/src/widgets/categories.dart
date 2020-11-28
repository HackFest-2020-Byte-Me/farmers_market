import 'package:flutter/material.dart';
import 'package:flutter_appa/src/models/category.dart';
import 'package:flutter_appa/src/widgets/textCustomized.dart';

import '../files.dart';
List<Category> categoriesList = [
  Category(name: "Rice", image: "rice.png"),
  Category(name: "Fruits", image: "fruits.png"),
  Category(name: "Veggies", image: "veggies.png"),
  Category(name: "Seafoods", image: "seafood.png"),
  Category(name: "Beef", image: "beef.png"),
  Category(name: "Pork", image: "pork.png"),

];


class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (_, index){
          return Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                      color: white,
                      boxShadow: [
                        BoxShadow(
                            color: grey[500],
                            offset: Offset(2, 2),
                            blurRadius: 20
                        )
                      ],
                    ),
                    child: Padding(padding: EdgeInsets.all(4),
                      child: Image.asset("images/${categoriesList[index].image}", width: 50, height: 50,),)
                ),
                SizedBox(height: 10,),
                CustomText(text: categoriesList[index].name, size: 14, color: black,)
              ],
            ),

          );
        },
      ),
    ); //rice in a box
  }
}



