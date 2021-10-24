// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:galleryapp/widgets/BodyWidget.dart';
import 'package:galleryapp/widgets/ButtonWidget.dart';
import 'package:galleryapp/widgets/CardWidget.dart';
import '../constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  final textController = TextEditingController();
  final textController1 = TextEditingController();
  final textController2 = TextEditingController();
  late String photographerName, imageURL, description;
  bool favs = false;
  List<String> arr = ['Jan', 'Feb','Mar','Apr','May','Jun','Jul','Aug','Sept','Oct','Nov','Dec'];

 final FirebaseFirestore _firestore = FirebaseFirestore.instance;

   showCustomDialog(BuildContext context) => showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context){
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          insetPadding: const EdgeInsets.all(5),
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 350,
              height: 260,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 8,),

                  Text("Add Photo",

                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const SizedBox(width: 8,),

                  Expanded(

                    child: Text("Photographer Name",

                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black
                      ),
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Flexible(
                    child: Container(
                      height: 30,
                      child: TextField(
                        controller: textController,
                        onChanged: (value) {
                          //Do something with the user input.
                          photographerName = value;
                        },

                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter text',
                            contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 8.0)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
                  SizedBox(height: 18,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SizedBox(width: 8,),
                      Expanded(
                        child: Text("Image Url",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Flexible(
                        child: Container(
                          height: 30,
                          child: TextField(
                            controller: textController1,
                            onChanged: (value) {
                              //Do something with the user input.
                              imageURL = value;
                            },
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter text',
                                contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 8.0)
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 18,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SizedBox(width: 8,),
                      Expanded(
                        child: Text("Description",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Flexible(
                        child: Container(
                          height: 30,
                          child: TextField(
                            controller: textController2,
                            onChanged: (value) {
                              //Do something with the user input.
                              description = value;
                            },
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter text',
                                contentPadding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 8.0)
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 18,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: ButtonWidget(
                          text: "CANCEL",
                          onPress: (){
                            textController.clear();
                            textController1.clear();
                            textController2.clear();
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(width: 20,),
                      Flexible(
                        child:ButtonWidget(
                          text: "ADD",
                          onPress: (){
                           Timestamp myTimeStamp = Timestamp.fromDate(DateTime.now());
                            DateTime now = DateTime.now();
                            String month = arr[(now.month)-1];
                            String date = "${now.day} $month, ${now.year}";
                            //Implement send functionality.
                            _firestore.collection('gallery').add(
                                {
                                  'name':photographerName,
                                  'url':imageURL,
                                  'desc':description,
                                  'time':myTimeStamp,
                                  'date':date,
                                  'fav':favs
                                }
                            );
                            textController.clear();
                            textController1.clear();
                            textController2.clear();
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 18,),
                ],
              ),
            ),
          ),
        );
      }
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: kButtonColor,
          child: Icon(Icons.add),
          onPressed: () => showCustomDialog(context),
      ),
      appBar: AppBar(
        title: Text("Photo Gallery"),
        backgroundColor: kBackgroundColor,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () {

              }),
          IconButton(
              icon: Icon(Icons.sort),
              onPressed: () {

              })
        ],
      ),
      body: BodyWidget()
    );
  }
}







