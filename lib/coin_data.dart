import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '7F05244B-1EB3-41D9-ACF7-01D70C038B88';

class CoinData {
  static Future<double> getCoinData(String crypto, String currency) async {
    final response = await http.get(Uri.parse("$coinAPIURL/$crypto/$currency"),
        headers: {"X-CoinAPI-Key": apiKey});
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json["rate"];
    } else {
      print(response.statusCode);
      return null;
    }
  }
}
