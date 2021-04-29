import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
    fontFamily: 'raleway',
    fontSize: 100.0,
    color: Colors.blue,
    fontWeight: FontWeight.bold);

const kMessageTextStyle = TextStyle(
  fontFamily: 'raleway',
  fontSize: 60.0,
  fontWeight: FontWeight.bold,
  color: Colors.blueAccent,
);

const kButtonTextStyle = TextStyle(
  fontSize: 20.0,
  fontFamily: 'raleway',
  backgroundColor: Colors.blue,
  color: Colors.yellowAccent,
  fontWeight: FontWeight.bold,
);

const kConditionTextStyle =
    TextStyle(fontSize: 100.0, fontFamily: 'raleway', color: Colors.blueAccent);

const KGoButtonTextStyle = TextStyle(
  color: Colors.yellowAccent,
  fontFamily: 'raleway',
  fontWeight: FontWeight.bold,
  fontSize: 20.0,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.blueAccent,
    size: 45.0,
  ),
  hintText: "Enter City Name",
  contentPadding: EdgeInsets.all(15.0),
  hintStyle: TextStyle(
    color: Colors.blueAccent,
    fontFamily: 'raleway',
    fontSize: 20.0,
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.blue,
    ),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(0.0),
    ),
    borderSide: BorderSide.none,
  ),
);
