import 'package:flutter/material.dart';

InputDecoration textFieldDecoration(String hint) {
  return InputDecoration(
    hintText: hint,
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black54, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
  );
}

InputDecoration textFieldSellDecoration(String hint) {
  return InputDecoration(
    hintText: hint,
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black54, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
  );
}

final kDarkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Color(0xFF212121),
  brightness: Brightness.dark,
  backgroundColor: Color(0xFF212121),
  scaffoldBackgroundColor: Colors.black54,
  accentColor: Color(0xFF2296F3),
  dividerColor: Colors.white54,
);
