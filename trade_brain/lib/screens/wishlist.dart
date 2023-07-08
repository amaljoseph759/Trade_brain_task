import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/wishlist_controller.dart';

class Wishlist extends StatelessWidget {
  Wishlist({super.key});
  WishListconroller wishListconroller = Get.put(WishListconroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("wishlist"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Obx(() => ListView.builder(
                  shrinkWrap: true,
                  itemCount: wishListconroller.wishList.length,
                  itemBuilder: (BuildContext context, index) {
                    return ListTile(
                      title: Text(wishListconroller.wishList[index].name),
                      subtitle: Text(
                          wishListconroller.wishList[index].price.toString()),
                      trailing: IconButton(
                        onPressed: () {
                          wishListconroller.delete(index);
                          Get.snackbar("Message", "removed from wishList",
                              backgroundColor: Colors.red,
                              colorText: Colors.white);
                        },
                        icon: Icon(Icons.add),
                      ),
                    );
                  })),
            ],
          ),
        ),
      ),
    );
  }
}
