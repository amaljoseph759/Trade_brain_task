// import 'dart:convert';
// import 'dart:async';

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:trade_brain/model/model.dart';

// class StockService {
//   static Future<List<StockApi>> fetch(company) async {
//     final url = Uri.parse(
//         "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=$company&interval=5min&apikey=1747TIEM9L55DZ02");

//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       final finalresp = json.decode(response.body);
//       print(finalresp);

//       //var subfilteredData = finalresp;

//       return finalresp.map((json) => StockApi.fromJson(json)).toList();
//       //return StockApi.fromJson(json.decode(finalresp))
//     } else {
//       throw Exception();
//     }
//   }
// }
