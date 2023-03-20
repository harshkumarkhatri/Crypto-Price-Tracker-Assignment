import 'package:cash_rich_assignment/model/coin.dart';
import 'package:cash_rich_assignment/request/network_request.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final coinStateFuture = FutureProvider.family<Map<String, Coin>, String>(
  (ref, params) async {
    final data = await getCoinData(params);
    return data;
  },
);
