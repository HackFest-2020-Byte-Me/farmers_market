import 'package:flutter/material.dart';
import 'package:flutter_appa/src/widgets/categories.dart';
import '../files.dart';
import '../widgets/textCustomized.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    text: "What would you like to buy?",
                    size: 18,
                  )),

                Stack(
                  children: [
                    IconButton(icon: Icon(Icons.notifications_none), onPressed: (){}),
                    Positioned(
                      top: 10,
                      right: 12,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: red,
                          borderRadius: BorderRadius.circular(20)
                        )
                      ),
                    )
                  ],
                )
              ],
            ), // header
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: white,
                   boxShadow: [
                     BoxShadow(
                       color: grey[300],
                       offset: Offset(1, 1),
                       blurRadius: 4
                     )
                   ]
                ),
                child: ListTile(
                  leading: Icon(Icons.search, color: grey,),
                  title: TextField(
                    decoration: InputDecoration(
                      hintText: "Find wet and dry items",
                      border: InputBorder.none
                    ),
                  ),
                  trailing: Icon(Icons.filter_list, color: grey),
                )
              ),
            ), //search padding

            SizedBox(
              height: 5,
            ),//box

            Categories(),

            Padding(
               padding: const EdgeInsets.all(8.0),
               child: CustomText(text: "Featured", size: 20, color: grey,),
             ),

            Container(
              height: 240,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (_, index){
                return Padding(padding: EdgeInsets.all(8),
                child: Container(
                  height: 220,
                  width: 80,
                  decoration: BoxDecoration(
                      color: white,
                      boxShadow: [
                        BoxShadow(
                            color: grey[300],
                            offset: Offset(1, 1),
                            blurRadius: 4
                        )
                      ]
                  ),
                  child: Column(
                    children: <Widget>[
                      Image.asset("images/table.png", height: 140, width: 140,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(

                            padding: const EdgeInsets.all(8.0),
                            child: CustomText(text: "Some food",),
                          ),
                          SizedBox(height: 4,),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                                color: white,
                                boxShadow: [
                                  BoxShadow(
                                      color: grey[300],
                                      offset: Offset(1, 1),
                                      blurRadius: 4
                                  )
                                ]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.favorite_border,color: red, size: 18,),
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                ),);
              }),
            )
          ],
        ),
      ),
    );
  }
}


