import 'dart:convert';
import 'package:cash_rich_assignment/model/coin.dart';
import 'package:cash_rich_assignment/secret.dart';
import 'package:http/http.dart' as http;

Map<String, Coin> parseCoinData(String responseBody) {
  var data = json.decode(responseBody)['data'] as Map<String, dynamic>;
  Map<String, Coin> newMap = {};
  data.forEach((key, value) {
    newMap[key] = Coin.fromJson(value);
  });
  return newMap;
}

Map<String, String> get headers => {
      "X-CMC_PRO_API_KEY": secretKey,
    };

Future<Map<String, Coin>> getCoinData() async {
  final queryParam = {
    "symbol": "BTC,ETH,LTC",
  };
  var url = Uri.https('pro-api.coinmarketcap.com',
      '/v1/cryptocurrency/quotes/latest', queryParam);

  final response = await http.get(
    url,
    headers: headers,
  );
  if (response.statusCode == 200) {
    return parseCoinData(response.body);
  } else {
    throw Exception("Cannot fetch coin data");
  }
}
