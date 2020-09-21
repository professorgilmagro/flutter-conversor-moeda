import 'package:conversor_moedas/helpers/calculator.dart';
import 'package:conversor_moedas/models/quotations.dart';
import 'package:conversor_moedas/pages/home/views/content.dart';
import 'package:conversor_moedas/pages/home/views/error.dart';
import 'package:conversor_moedas/pages/home/views/loading.dart';
import 'package:flutter/material.dart';

class BuildHomeView {
  AnimationController animationController;
  AsyncSnapshot snapshot;
  Map<Currency, Quotation> quotations;

  BuildHomeView(this.animationController, this.snapshot, quotations);

  Widget build() {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.waiting:
        return HomeLoadingView(animationController).build();

      default:
        if (snapshot.hasError) {
          return HomeErrorView().build();
        }

        Calculator calculator = Calculator(this.quotations);
        return HomeContentView(calculator).build();
    }
  }
}
