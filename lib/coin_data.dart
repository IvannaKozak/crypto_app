import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto_app/price_screen.dart';

const apiKey = 'CC9EF9B5-E83D-4B07-849A-D7B88D784254';
const coinApiURL = 'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=$apiKey';


class Currency {
  Future<dynamic> getRate(String currencySelected) async {
    Map<String, String> cryptoPrices = {};

    for (String crypto in cryptoList) {
      String url =
        'https://rest.coinapi.io/v1/exchangerate/$crypto/$currencySelected?apikey=$apiKey';

      http.Response response = await http.get(Uri.parse(url));

      
      if (response.statusCode == 200) {
      
        /// interprets a given string as JSON
        var decodedData = jsonDecode(response.body);
        double rate = decodedData['rate'];
        cryptoPrices[crypto] = rate.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}

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
  'UAH',
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

class CoinData {}
