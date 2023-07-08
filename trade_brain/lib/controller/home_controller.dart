import 'package:get/get.dart';
import 'package:trade_brain/model/model.dart';
import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:http/http.dart' as http;

class Stock {
  final String name;
  final double price;

  Stock({required this.name, required this.price});
}

class StockController extends GetxController {
  var stocks = <Stock>[].obs;
  RxBool isLoading = false.obs;

  void searchStocks(String keyword) async {
    isLoading.value = true;
    final url = Uri.parse(
        "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol=$keyword&outputsize=full&apikey=1747TIEM9L55DZ02");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        final responseBody = response.body;
        if (responseBody != null) {
          final data = json.decode(responseBody);

          if (data is Map<String, dynamic> &&
              data.containsKey('Error Message')) {
            // Handle API error message
            final errorMessage = data['Error Message'] as String;
            print(errorMessage);
            stocks.value = [];
          } else {
            print("enter tht else");
            final stockApi = stockApiFromJson(responseBody);
            isLoading.value = false;
            stocks.value = stockApi.timeSeriesDaily.entries.map((entry) {
              final dateTime = DateTime.parse(entry.key);
              final timeSeries = entry.value;

              return Stock(
                name: stockApi.metaData.the2Symbol,
                price: double.parse(timeSeries.the4Close),
              );
            }).toList();
          }
        } else {
          stocks.value = [];
        }
      } else {
        stocks.value = [];
      }
    }
  }

  @override
  void dispose() {
    searchStocks("keyword");
    // TODO: implement dispose
    super.dispose();
  }
}
