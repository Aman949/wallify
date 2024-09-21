// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wallify/pages/all_wallpaper.dart';
class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Categories",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins"
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AllWallpaper(category: "WildLife")));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20.0,right: 20.0,bottom: 20.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset("images/wildlife.jpg",width: MediaQuery.of(context).size.width,height: 200,fit: BoxFit.cover,))
                    , Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Text("WildLife",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins"
                        ),),
                      ),
                    ),
                    
                    ],),
                  ),
                ),
                  GestureDetector(
                     onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AllWallpaper(category: "Foods")));
                  },
                    child: Container(
                    margin: EdgeInsets.only(left: 20.0,right: 20.0,bottom: 20.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset("images/food.jpg",width: MediaQuery.of(context).size.width,height: 200,fit: BoxFit.cover,))
                    , Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Text("Foods",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins"
                        ),),
                      ),
                    ),
                    
                    ],),
                                    ),
                  ),
                  GestureDetector(
                     onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AllWallpaper(category: "City")));
                  },
                    child: Container(
                    margin: EdgeInsets.only(left: 20.0,right: 20.0,bottom: 20.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset("images/city.jpg",width: MediaQuery.of(context).size.width,height: 200,fit: BoxFit.cover,))
                    , Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Text("City",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins"
                        ),),
                      ),
                    ),
                    
                    ],),
                                    ),
                  ),  GestureDetector(
                     onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AllWallpaper(category: "Nature")));
                  },
                    child: Container(
                    margin: EdgeInsets.only(left: 20.0,right: 20.0,bottom: 20.0),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset("images/nature.jpg",width: MediaQuery.of(context).size.width,height: 200,fit: BoxFit.cover,))
                    , Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Center(
                        child: Text("Nature",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins"
                        ),),
                      ),
                    ),
                    
                    ],),
                                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}