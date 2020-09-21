import 'package:flutter/material.dart';

class HomeErrorView {
  Widget build() {
      return Center(
          child: Center(
            child: Column(
              children: [
                Icon(Icons.cloud_off, size: 80, color: Colors.amber),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text(
                      "Erro na obtenção dos dados de cotação.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.redAccent, fontSize: 18)
                  ),
                )
              ],
            ) ,
          )
      );
    }
}