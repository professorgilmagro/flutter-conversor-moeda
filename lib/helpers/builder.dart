import 'package:flutter/material.dart';

Widget BuildTextField(String label,
    {String prefix,
    double top,
    double bottom,
    Function handleChange,
    TextEditingController controller}) {
  return Padding(
      padding: EdgeInsets.fromLTRB(0, top ?? 0, 0, bottom ?? 0),
      child: TextField(
          controller: controller,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          onChanged: handleChange,
          style: TextStyle(color: Colors.white, fontSize: 25),
          cursorColor: Colors.amber,
          decoration: InputDecoration(
              labelText: label,
              prefixText: "$prefix ",
              border: OutlineInputBorder(),
              labelStyle: TextStyle(color: Colors.amberAccent))));
}
