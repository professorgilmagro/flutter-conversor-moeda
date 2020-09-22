import 'package:conversor_moedas/helpers/calculator.dart';
import 'package:flutter/material.dart';

class HomeContentView {
  TextEditingController realController = TextEditingController();
  TextEditingController euroController = TextEditingController();
  TextEditingController dolarController = TextEditingController();
  Calculator calc;

  HomeContentView(quotations) {
    this.calc = Calculator(quotations);
  }

  void _cleanAll() {
    realController.text = "";
    euroController.text = "";
    dolarController.text = "";
  }

  void _realChanged(String text) {
    if (text.isEmpty) {
      return _cleanAll();
    }

    double value = double.parse(text);
    dolarController.text = calc.dolarFromReal(value).toStringAsPrecision(3);
    euroController.text = calc.euroFromReal(value).toStringAsPrecision(3);
  }

  void _euroChanged(String text) {
    if (text.isEmpty) {
      return _cleanAll();
    }

    double value = double.parse(text);
    dolarController.text = calc.dolarFromEuro(value).toStringAsFixed(3);
    realController.text = calc.realFromEuro(value).toStringAsFixed(3);
  }

  void _dolarChanged(String text) {
    if (text.isEmpty) {
      return _cleanAll();
    }

    double value = double.parse(text);
    euroController.text = calc.euroFromDolar(value).toStringAsFixed(3);
    realController.text = calc.realFromDolar(value).toStringAsFixed(3);
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
            _renderTextField('Reais',
                prefix: 'R\$',
                top: 10,
                controller: realController,
                handleChange: _realChanged),
            _renderTextField('Dólares',
                prefix: 'US\$',
                top: 20,
                controller: dolarController,
                handleChange: _dolarChanged),
            _renderTextField('Euros',
                prefix: '€',
                top: 20,
                controller: euroController,
                handleChange: _euroChanged),
          ],
        ));
  }

  Widget _renderTextField(String label,
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
}
