import 'package:conversor_moedas/helpers/calculator.dart';
import 'package:flutter/material.dart';

class HomeContentView {
  TextEditingController realController = TextEditingController();
  TextEditingController euroController = TextEditingController();
  TextEditingController dolarController = TextEditingController();
  Calculator calculator;

  HomeContentView(this.calculator);

  void _onChangedReal() {
    euroController.text = "";
  }

  void _onChangedEuro() {
    euroController.text = "";
  }

  void _onChangedDolar() {
    euroController.text = "";
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
                onChange: _onChangedReal),
            _renderTextField('Dólares',
                prefix: 'US\$',
                top: 20,
                controller: dolarController,
                onChange: _onChangedDolar),
            _renderTextField('Euros',
                prefix: '€',
                top: 20,
                controller: euroController,
                onChange: _onChangedEuro),
          ],
        ));
  }

  Widget _renderTextField(String label,
      {String prefix,
      double top,
      double bottom,
      Function onChange,
      TextEditingController controller}) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, top ?? 0, 0, bottom ?? 0),
        child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.white, fontSize: 25),
            cursorColor: Colors.amber,
            onChanged: onChange,
            decoration: InputDecoration(
                labelText: label,
                prefixText: "$prefix ",
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.amberAccent))));
  }
}
