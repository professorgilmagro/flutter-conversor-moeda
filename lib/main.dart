import 'package:conversor_moedas/pages/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Conversor de Moedas',
    home: Home(),
    theme: ThemeData(
        hintColor: Colors.white,
        primaryColor: Colors.amber,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow)),
          hintStyle: TextStyle(color: Colors.yellow),
        )),
  ));
}
