import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
 const kButtonColor = Color(0xFFF68F50);
 const kBackgroundColor = Color(0xFF4A4C50);
 var kDialogButtonStyle = ButtonStyle(
  padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
  backgroundColor: MaterialStateProperty.all<Color>(kButtonColor),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side:BorderSide(color: Colors.white)
      )
  ),
 );