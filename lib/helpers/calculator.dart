import 'package:conversor_moedas/models/quotations.dart';

class Calculator {
  Map<Currency, Quotation> quotations;

  Calculator(this.quotations);

  Quotation getDolarQuotation() => getQuotation(Currency.USD);

  Quotation getEuroQuotation() => getQuotation(Currency.EUR);

  Quotation getBitcoinQuotation() => getQuotation(Currency.BTC);

  Quotation getQuotation(Currency type) {
    return this.quotations[type] ??
        Quotation(type.toString(), buy: 0, sell: 0, variation: 0);
  }
}
