import 'package:conversor_moedas/models/quotations.dart';
import 'package:conversor_moedas/pages/home/views/content.dart';
import 'package:conversor_moedas/pages/home/views/error.dart';
import 'package:conversor_moedas/pages/home/views/loading.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: new Duration(seconds: 1),
    );

    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    List loadingStates = [ConnectionState.none, ConnectionState.waiting];

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
          future: fetchQuotations(),
          builder: (context, snapshot) {
            if (loadingStates.contains(snapshot.connectionState)) {
              return HomeLoadingView(animationController).build();
            }

            if (snapshot.hasError) {
              String message = "Erro na obtenção dos dados no servidor!";
              return HomeErrorView(message).build();
            }

            return HomeContentView(snapshot.data).build();
          },
        ));
  }
}
