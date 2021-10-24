// ignore_for_file: file_names, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:galleryapp/constants.dart';


class ButtonWidget extends StatelessWidget {

  final String text;
  final VoidCallback onPress;

  ButtonWidget({required this.text,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37, //60
      width: 120, //200
      child: TextButton(
        onPressed: onPress,
        style: kDialogButtonStyle,
        child: Text(text,
          style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}