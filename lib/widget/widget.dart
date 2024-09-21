// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wallify/models/photo_model.dart';
import 'package:wallify/pages/full_screen.dart';

Widget wallpaper(List<PhotoModel> listPhotos, BuildContext context) {
  
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      padding: EdgeInsets.all(4.0),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: listPhotos.map((PhotoModel photoModel) {
        return GridTile(
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FullScreen(imagepath: photoModel.src!.portrait!)));
              },
              child: Hero(
                  tag: photoModel.src!.portrait!,
                  child: Container(
                    child: CachedNetworkImage(
                      imageUrl: photoModel.src!.portrait!,
                      fit: BoxFit.cover,
                    ),
                  )),
            ));
      }).toList(),
    ),
  );
}
