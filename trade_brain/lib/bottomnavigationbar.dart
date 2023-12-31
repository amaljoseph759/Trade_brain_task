import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trade_brain/screens/homepage.dart';
import 'package:trade_brain/screens/wishlist.dart';

import 'controller/home_controller.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  StockController stockcontoller = Get.put(StockController());

  int index = 0;
  final screens = [Homepage(), Wishlist()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20.0),
            //bottomRight: Radius.circular(40.0),
            topLeft: Radius.circular(20.0),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.shade500,
              blurRadius: 12,
            ),
          ],
        ),
        child: BottomNavigationBar(
            currentIndex: index,
            onTap: (index) => setState(() {
                  this.index = index;
                  if (index == 1) {
                    print("amal");
                    stockcontoller.stocks.value = [];
                    //stockcontoller.dispose();
                  }
                }),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_max_sharp),
                  label: "Home",
                  backgroundColor: Colors.grey),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: "Wishlist",
                  backgroundColor: Colors.grey),
            ]),
      ),
      // floatingActionButton: FloatingActionButton(

      //     // isExtended: true,
      //     child: Image.asset("assets/images/scan.png"),
      //     backgroundColor: Colors.grey,
      //     onPressed: () {
      //       Get.toNamed("/qrscaneer");
      //     }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
