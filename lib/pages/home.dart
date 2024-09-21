// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List wallpaperimages = [
    "images/one.jpg",
    "images/two.jpg",
    "images/three.jpg"
  ];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 10, left: 10,right: 10.0),
          child: Column(
            children: [
              Row(
                children: [
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(60),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          "images/icon.jpg",
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        )),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Wallify",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins"),
                      ),
                    ),
                  ),
                  
                ],
              ),
              SizedBox(height: 30.0,),

              CarouselSlider.builder(
                      itemCount: wallpaperimages.length,
                      itemBuilder: (context, index, realindex){
                        final res = wallpaperimages[index];
                        return buildImage(res,index);
                      },
                      options: CarouselOptions(
                        autoPlay: true,
                        height: MediaQuery.of(context).size.height/1.5,
                        viewportFraction: 1,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,onPageChanged: (index, reason) {
                          setState(() {
                            activeIndex=index;
                          });
                        },),)
                       , SizedBox(height: 20.0,),
                       Center(child: builIndicator()),
            ],
          ),
        ),
      ),
     
    );
  }
   Widget builIndicator()=>AnimatedSmoothIndicator(activeIndex: activeIndex, count: 3,effect: SlideEffect(
    dotWidth: 15
,dotHeight: 15,activeDotColor: Colors.blue   ),);

   Widget buildImage(String urlImage, int index)=>Container(
        height: MediaQuery.of(context).size.height/1.5,
        width: MediaQuery.of(context).size.width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(urlImage,fit: BoxFit.cover,)),
      );
}
