import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appa/src/widgets/bottom_navigation_icon.dart';
import 'package:flutter_appa/src/widgets/categories.dart';
import 'package:flutter_appa/src/widgets/featured_items.dart';
import 'package:flutter_appa/src/widgets/small_button.dart';
import '../helpers/styles.dart';
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
                    IconButton(
                        icon: Icon(Icons.notifications_none), onPressed: () {}),
                    Positioned(
                      top: 10,
                      right: 12,
                      child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              color: red,
                              borderRadius: BorderRadius.circular(20))),
                    )
                  ],
                )
              ],
            ), // header
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(color: white, boxShadow: [
                    BoxShadow(
                        color: grey[300], offset: Offset(1, 1), blurRadius: 4)
                  ]),
                  child: ListTile(
                    leading: Icon(
                      Icons.search,
                      color: grey,
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                          hintText: "Find wet and dry items",
                          border: InputBorder.none),
                    ),
                    trailing: Icon(Icons.filter_list, color: grey),
                  )),
            ), //search padding

            SizedBox(
              height: 5,
            ), //box

            Categories(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: "Featured",
                size: 20,
                color: grey,
              ),
            ),
            Featured(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: "Popular",
                size: 20,
                color: grey,
              ),
            ),//popular

            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset("images/egg_popular.jpg")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[

                        SmallButton(Icons.favorite),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 50,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: <Widget>[

                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Icon(Icons.star, color: Colors.red[900],size: 20,),
                                ),
                                Text("4.5"),

                              ],
                            ),
                          ),
                        ),

                      ],
                    ),

                  ),

                  Positioned.fill(child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20 ),bottomRight: Radius.circular(20),

                          ),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.8),
                              Colors.black.withOpacity(0.7),
                              Colors.black.withOpacity(0.6),
                              Colors.black.withOpacity(0.4),
                              Colors.black.withOpacity(0.1),
                              Colors.black.withOpacity(0.05),
                              Colors.black.withOpacity(0.025),

                            ],
                          )
                      ),
                    ),
                  )),
                  Positioned.fill(child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
                          child: RichText(text: TextSpan(
                              children: [
                                TextSpan(text: "Egg Salted \n",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                                TextSpan(text: "by: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300)),
                                TextSpan(text: "Mang Oka's Farm \n",style: TextStyle(fontSize: 16)),

                              ], style: TextStyle(color: white)
                          ),),

                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(text: TextSpan(
                              children: [
                                TextSpan(text: "\₱25.00 \n",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),

                              ], style: TextStyle(color: white)
                          ),),

                        ),


                      ],
                    ),
                  ))

                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        height: 73,
        color: white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              BottomNavIcon(
                image: "home.png",
                name: "Home",
              ),
              BottomNavIcon(
                image: "point.png",
                name: "Nearby",
              ),
              BottomNavIcon(
                image: "shop.png",
                name: "Shop",
              ),
              BottomNavIcon(
                image: "account.png",
                name: "Account",
              ),
            ]
          ),
        ),
      ),
    );
  }
}
