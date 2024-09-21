// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wallify/service/database.dart';

class AllWallpaper extends StatefulWidget {
  String category;
  AllWallpaper({required this.category});

  @override
  State<AllWallpaper> createState() => _AllWallpaperState();
}

class _AllWallpaperState extends State<AllWallpaper> {
  Stream? categoryStream;
  getontheload()async{
    categoryStream = await DatabaseMethods().getCategory(widget.category);
    setState(() {
      
    });
  }
  @override
  void initState(){
    super.initState();
    getontheload();
   }
  Widget allWallpaper() {
    return StreamBuilder(
        stream: categoryStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      mainAxisSpacing: 6.0,
                      crossAxisSpacing: 6.0),
                      itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(ds["Image"],fit: BoxFit.cover,)),
                    );
                  })
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            Center(
              child: Text(
                widget.category,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Poppins",
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(child: allWallpaper())
          ],
        ),
      ),
    );
  }
}
