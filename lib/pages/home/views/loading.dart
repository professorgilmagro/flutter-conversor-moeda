import 'package:flutter/material.dart';

class HomeLoadingView {
  AnimationController animationController;

  HomeLoadingView(this.animationController);

  Widget build() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: animationController,
            child: Center(
                child: Icon(
              Icons.monetization_on,
              color: Colors.amberAccent,
              size: 40,
            )),
            builder: (BuildContext context, Widget _widget) {
              return new Transform.rotate(
                angle: animationController.value * 16,
                child: _widget,
              );
            },
          ),
          Padding(
              padding: EdgeInsets.all(10),
              child: Text("Obtendo cotações atuais...",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white)))
        ]);
  }
}
