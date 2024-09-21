// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_local_variable

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wallify/service/database.dart';

class AddWallpaper extends StatefulWidget {
  const AddWallpaper({super.key});

  @override
  State<AddWallpaper> createState() => _AddWallpaperState();
}

class _AddWallpaperState extends State<AddWallpaper> {
  final List<String> categoryitmes = ["WildLife","Foods","Nature","City"] ; 
  String? value;
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  Future getImage()async{
      var image = await _picker.pickImage(source: ImageSource.gallery);
      selectedImage = File(image!.path);
      setState(() {
        
      });
  }

  uploadImage()async{
    if(selectedImage!=null)
    {
      String addId = randomAlphaNumeric(10);
      Reference firebaseStorageRef = FirebaseStorage.instance.ref().child("blogImages").child(addId);
      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);
      var downloadUrl = await(await task).ref.getDownloadURL();
      Map<String, dynamic> addItem={
      "Image":downloadUrl,
      "Id":addId
      };
      await DatabaseMethods().addWallpaper(addItem, addId, value!).then((value){
        Fluttertoast.showToast(
        msg: "Uploaded Successfully",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,color: Color(0xff373866),),
        ),
        centerTitle: true,
        title: Text("Add Wallpaper",style: TextStyle(
          color: Colors.black,fontSize: 20.0,fontFamily: "Poppins",fontWeight: FontWeight.bold
        ),),
      ),
      body: Container(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 20.0,),
              selectedImage == null ? 
              GestureDetector(
                onTap: () {
                  getImage();
                },
                child: Material(
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black,width: 1.5),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Icon(Icons.camera_alt_outlined,color: Colors.black,),
                    ),
                  ),
                ),
              ):Material(
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black,width: 1.5),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          selectedImage!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 20.0,),
              Container(
                margin: EdgeInsets.only(left: 20.0,right: 20.0),
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffececf8),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: DropdownButtonHideUnderline(child: DropdownButton<String>(items: categoryitmes.map((toElement)=>DropdownMenuItem<String>(value: toElement,child: Text(toElement,style: TextStyle(
                  fontSize: 18.0,color: Colors.black,
                ),),)).toList(),
                onChanged: ((value) => setState(() {
                  this.value = value;
                })) ,
                hint: Text('Select Category'),
                value: value,
                )),
              ),
              SizedBox(height: 40.0,),
                GestureDetector(
                          onTap: () {
                            uploadImage();
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.0),
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.black,borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child: Text("Add",style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold
                              ),),
                            ),
                          ),
                        )
            ],
          ),
        ),
      ),
    );
  }
}