// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:wallify/models/photo_model.dart';
import 'package:wallify/widget/widget.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  List<PhotoModel>photos =[];
  TextEditingController searchcontoller = new TextEditingController(); 
  bool search = false;
  getSearchWallpaper(String searchQuery)async{
    await http.get(Uri.parse("https://api.pexels.com/v1/search?query=$searchQuery&per_page=30"),headers: {"Authorization":"yWrXwHRTRKmQoJckzguYp7T7bKxOZVyWiAKK42VjyG3OuMOLq3Hq7X0u"}).then((value){
      Map<String ,dynamic> jsonData = jsonDecode(value.body);
      jsonData['photos'].forEach((element){
        PhotoModel photoModel = new PhotoModel();
        photoModel = PhotoModel.fromMap(element); 
        photos.add(photoModel);
      });
      setState(() {
        search = true;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Center(
                  child: Text(
                "Search",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins"),
              )),
              SizedBox(
                height: 5.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                decoration: BoxDecoration(
                    color: Color(0xffececf8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: searchcontoller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          getSearchWallpaper(searchcontoller.text);
                        },
                        child: search?GestureDetector(
                          onTap: () {
                            photos = [];
                            search = false;
                            setState(() {
                              
                            });
                          },
                          child: Icon(
                            Icons.close,
                            color: Color.fromARGB(255, 84, 87, 93),
                          ),
                        ):Icon(
                          Icons.search_outlined,
                          color: Color.fromARGB(255, 84, 87, 93),
                        ),
                      )),
                ),
              ),
              SizedBox(height: 20.0,),
              Expanded(child: wallpaper(photos, context))
            ],
          ),
        ),
      ),
    );
  }
}
