import 'package:flutter/material.dart';

class HomeErrorView {
  String message;
  IconData icon;

  HomeErrorView(this.message, {this.icon});

  Widget build() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(icon ?? Icons.cloud_off, size: 80, color: Colors.redAccent),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.amber, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
