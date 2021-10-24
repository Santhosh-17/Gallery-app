
// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';


class HomePageCard extends StatefulWidget {
  final imageUrl, title, subtitle, time;
  final fav;

  HomePageCard({this.imageUrl,this.title,this.time,this.subtitle,this.fav });

  @override
  _HomePageCardState createState() => _HomePageCardState();
}

class _HomePageCardState extends State<HomePageCard> {
  Color iconColor = Colors.white;
  int toggle = 0;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 203,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xff707070),
          width: 1,
        ),
        image: DecorationImage(
            image: NetworkImage(widget.imageUrl), fit: BoxFit.fill),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                onPressed: (){
                  setState(() {
                    if(toggle==0){
                      iconColor = Colors.red;
                      toggle = 1;
                    }else{
                      iconColor = Colors.white;
                      toggle = 0;
                    }
                  });
                },
                icon: Icon(
                  Icons.favorite,
                  color: iconColor,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.49),
                ),
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.subtitle,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: MediaQuery.of(context).size.width > 1000 ? 10 : 7,
                            color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 8,),
                    Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            widget.time,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: MediaQuery.of(context).size.width > 1000 ? 10 : 7,
                                color: Colors.white),
                          ),
                        ),
                        Align(
                         alignment: Alignment.bottomRight,
                          child: Text(
                            "-by ${widget.title}",
                            style: TextStyle(
                                fontFamily: 'Poppins-Regular',
                                // fontWeight: FontWeight.bold,
                                fontSize: MediaQuery.of(context).size.width > 1000 ? 12 : 8,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
