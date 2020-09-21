import 'package:conversor_moedas/services/api.dart';

enum Currency { USD, EUR, GBP, ARS, BTC }

class Quotation {
  String type;
  String name;
  double buy;
  double sell;
  double variation;

  Quotation(this.type, {this.name, this.buy, this.sell, this.variation});

  factory Quotation.fromJson(Map<String, dynamic> json, String type) {
    return Quotation(type,
        name: json["name"].toString(),
        buy: json["buy"],
        sell: json["sell"],
        variation: json["variation"]);
  }
}

Future<Map<String, Quotation>> fetchQuotations() async {
  final data = await Api().getData();
  Map<String, Quotation> items = Map();

  dynamic currencies = data["results"]["currencies"];
  for (Currency type in Currency.values) {
    String key = type.toString().split('.').last;
    items.putIfAbsent(key, () => Quotation.fromJson(currencies[type], key));
  }

  return items;
}
