import 'package:conversor_moedas/models/quotations.dart';

class CurrencyConverter {
  Map<Currency, Quotation> quotations;

  CurrencyConverter(this.quotations);

  Quotation getDolarQuotation() => getQuotation(Currency.USD);

  Quotation getEuroQuotation() => getQuotation(Currency.EUR);

  Quotation getBitcoinQuotation() => getQuotation(Currency.BTC);

  Quotation getQuotation(Currency type) {
    return this.quotations[type] ??
        Quotation(type.toString(), buy: 0, sell: 0, variation: 0);
  }

  double realToDolar(double value) {
    return value / getDolarQuotation().buy;
  }

  double realToEuro(double value) {
    return value / getEuroQuotation().buy;
  }

  double dolarToReais(double value) {
    return value * getDolarQuotation().buy;
  }

  double dolarToEuro(double value) {
    return dolarToReais(value) / getEuroQuotation().buy;
  }

  double euroToReais(double value) {
    return value * getEuroQuotation().buy;
  }

  double euroToDolar(double value) {
    return euroToReais(value) / getDolarQuotation().buy;
  }
}
