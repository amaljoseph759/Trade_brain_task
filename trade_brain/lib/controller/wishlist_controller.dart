import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:trade_brain/controller/home_controller.dart';

// class WishlistStock {
//   final String name;
//   final double price;

//   WishlistStock({required this.name, required this.price});
// }

class WishListconroller extends GetxController {
  RxList wishList = <Stock>[].obs;
  RxList nullarray = <Stock>[].obs;
  @override
  void onInit() {
    getStocks();
    // TODO: implement onInit
    super.onInit();
  }

  void add(
    item,
  ) async {
    wishList.add(item);
    final stockDb = Hive.box('stocksBox');
    // await stockDb.delete('wishlistData');
    stockDb.put("wishlistData", wishList);
    print("/////////////");
    final data = await stockDb.get('wishlistData');
    print("$data ----------------------");

    getStocks();
  }

  getStocks() async {
    final stockDb = Hive.box('stocksBox');
    wishList = await stockDb.get('wishlistData') ?? nullarray;

    print("@@@@@@@@@@@@@@@@@@@@@/");

    print(wishList);
    print("@@@@@@@@@@@@@@@@@@@@@/");
  }

  void delete(index) async {
    wishList.removeAt(index);
    final stockDb = Hive.box('stocksBox');
    await stockDb.delete('wishlistData');
    stockDb.put("wishlistData", wishList);
  }
}
