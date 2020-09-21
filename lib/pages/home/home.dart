import 'package:conversor_moedas/models/quotations.dart';
import 'package:conversor_moedas/pages/home/build_view.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  Future<Map<String, Quotation>> quotations;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    quotations = fetchQuotations();

    animationController = AnimationController(
      vsync: this,
      duration: new Duration(seconds: 1),
    );

    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        shadowColor: Colors.amber,
        title: Text(
          '\$ Conversor de moedas \$',
          style: TextStyle(color: Colors.yellow, fontSize: 16),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
          future: quotations,
          builder: (context, snapshot) =>
              BuildHomeView(animationController, snapshot, quotations).build()),
    );
  }
}
