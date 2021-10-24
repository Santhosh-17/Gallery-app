// ignore_for_file: file_names, prefer_const_constructors
import 'package:date_format/date_format.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:galleryapp/widgets/CardWidget.dart';
class BodyWidget extends StatelessWidget {
  const BodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;


    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('gallery').orderBy("time",descending: false).snapshots(),
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator(backgroundColor: Colors.lightBlueAccent,));
          }else{

            List<Widget> msgs = snapshot.data!.docs.map((document) {
              final photographerName = document['name'];
              final imageURL = document['url'];
              final description = document['desc']; //(document['time']).toString()
              final myTimeStamp = document['date'];
              final favs = document['fav'];
              return HomePageCard(title: photographerName,subtitle: description,fav: favs,imageUrl: imageURL,time:myTimeStamp);
            }).toList();
            return GridView(
              children: msgs,
              padding: EdgeInsets.all(10.0),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: MediaQuery.of(context).size.width > 1000 ? MediaQuery.of(context).size.width/5 : MediaQuery.of(context).size.width/3,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
              ),
              // itemCount: 0,
              // itemBuilder: (context,index){
              //   return HomePageCard();
              // }
            );
          }
        }
    );
  }
}