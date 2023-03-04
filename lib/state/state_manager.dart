import 'package:cash_rich_assignment/model/coin.dart';
import 'package:cash_rich_assignment/request/network_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final coinStateFuture = FutureProvider<Map<String, Coin>>((ref) async {
  return getCoinData();
});
