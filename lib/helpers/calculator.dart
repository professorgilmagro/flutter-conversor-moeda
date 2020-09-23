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

  double dolarFromReal(double value) {
    return value / getDolarQuotation().buy;
  }

  double euroFromReal(double value) {
    return value / getEuroQuotation().buy;
  }

  double realFromDolar(double value) {
    return value * getDolarQuotation().buy;
  }

  double euroFromDolar(double value) {
    return realFromDolar(value) / getEuroQuotation().buy;
  }

  double realFromEuro(double value) {
    return value * getEuroQuotation().buy;
  }

  double dolarFromEuro(double value) {
    return realFromEuro(value) / getDolarQuotation().buy;
  }
}
