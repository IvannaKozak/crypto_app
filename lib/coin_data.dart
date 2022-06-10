import 'dart:convert';
import 'package:http/http.dart' as http;

const apiKey = 'CC9EF9B5-E83D-4B07-849A-D7B88D784254';
const coinApiURL = 'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=$apiKey';


class Currency {
  Future<dynamic> getRate() async {
   
    http.Response response = await http.get(Uri.parse(coinApiURL));
    if (response.statusCode == 200) {
    
      /// interprets a given string as JSON
      var decodedData = jsonDecode(response.body);
      var rate = decodedData['rate'];
      return rate;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
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
