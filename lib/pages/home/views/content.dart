import 'package:conversor_moedas/helpers/builder.dart';
import 'package:conversor_moedas/helpers/calculator.dart';
import 'package:flutter/material.dart';

class HomeContentView {
  TextEditingController realControl = TextEditingController();
  TextEditingController euroControl = TextEditingController();
  TextEditingController dolarControl = TextEditingController();
  CurrencyConverter converter;

  HomeContentView(quotations) {
    this.converter = CurrencyConverter(quotations);
  }

  void _cleanAll() {
    realControl.text = "";
    euroControl.text = "";
    dolarControl.text = "";
  }

  void _realChanged(String text) {
    if (text.isEmpty) {
      return _cleanAll();
    }

    double value = double.parse(text);
    dolarControl.text = converter.dolarFromReal(value).toStringAsPrecision(3);
    euroControl.text = converter.euroFromReal(value).toStringAsPrecision(3);
  }

  void _euroChanged(String text) {
    if (text.isEmpty) {
      return _cleanAll();
    }

    double value = double.parse(text);
    dolarControl.text = converter.dolarFromEuro(value).toStringAsFixed(3);
    realControl.text = converter.realFromEuro(value).toStringAsFixed(3);
  }

  void _dolarChanged(String text) {
    if (text.isEmpty) {
      return _cleanAll();
    }

    double value = double.parse(text);
    euroControl.text = converter.euroFromDolar(value).toStringAsFixed(3);
    realControl.text = converter.realFromDolar(value).toStringAsFixed(3);
  }

  Widget build() {
    return SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(20),
                child: Icon(Icons.monetization_on,
                    color: Colors.amber, size: 100)),
            BuildTextField('Reais',
                prefix: 'R\$',
                top: 10,
                controller: realControl,
                handleChange: _realChanged),
            BuildTextField('Dólares',
                prefix: 'US\$',
                top: 20,
                controller: dolarControl,
                handleChange: _dolarChanged),
            BuildTextField('Euros',
                prefix: '€',
                top: 20,
                controller: euroControl,
                handleChange: _euroChanged),
          ],
        ));
  }
}
