// Created a custom model
// Model could also be created using freezed

class Coin {
  int? id;
  String? name;
  String? symbol;
  int? cmcRank;
  Quote? quote;

  Coin({id, name, symbol, cmcRank, quote});

  Coin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    cmcRank = json['cmc_rank'];
    quote = json['quote'] != null ? Quote.fromJson(json['quote']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['cmc_rank'] = cmcRank;
    if (quote != null) {
      data['quote'] = quote!.toJson();
    }
    return data;
  }
}

class Quote {
  USD? usd;

  Quote({usd});

  Quote.fromJson(Map<String, dynamic> json) {
    usd = json['USD'] != null ? USD.fromJson(json['USD']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (usd != null) {
      data['USD'] = usd!.toJson();
    }
    return data;
  }
}

class USD {
  double? price;
  double? percentChange24h;

  USD({
    price,
    percentChange24h,
  });

  USD.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    percentChange24h = json['percent_change_24h'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['percent_change_24h'] = percentChange24h;
    return data;
  }
}
