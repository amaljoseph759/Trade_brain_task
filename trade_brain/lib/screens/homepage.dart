import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_brain/controller/wishlist_controller.dart';
import 'package:trade_brain/screens/wishlist.dart';

import '../controller/home_controller.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  StockController stockcontoller = Get.put(StockController());
  WishListconroller wishListconroller = Get.put(WishListconroller());

  @override
  Widget build(BuildContext context) {
    // wishListconroller.getStocks();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Homepage"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  onChanged: ((value) {
                    stockcontoller.searchStocks(value);
                  }
                      //placeController.serchtext.value = value
                      ),
                  decoration: const InputDecoration(labelText: 'search'),
                ),
                Obx(() => stockcontoller.isLoading.isTrue
                    ? CircularProgressIndicator()
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: stockcontoller.stocks.length,
                        itemBuilder: (BuildContext, index) {
                          final stock = stockcontoller.stocks[index];
                          return ListTile(
                            title: Text(stock.name),
                            subtitle: Text(
                                'Price: ${stock.price.toStringAsFixed(2)}'),
                            trailing: IconButton(
                              onPressed: () {
                                wishListconroller.add(
                                  Stock(name: stock.name, price: stock.price),
                                );

                                Get.snackbar(
                                    "Message", "item added to the wishList",
                                    colorText: Colors.white,
                                    backgroundColor: Colors.green);
                              },
                              icon: Icon(Icons.add),
                            ),
                          );
                        })),
              ],
            ),
          ),
        ));
  }
}
