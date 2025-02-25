import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';
import 'orderhire.dart';
import 'profile.dart';
import 'wallet.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int currentTabIndex = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late Homepage homepage;
  late Profile profile;
  late Orderhire orderhire;
  late Wallet wallet;

  @override
  void initState() {
    homepage = Homepage();
   
    orderhire = Orderhire();
    wallet = Wallet();
    profile = Profile();
    pages = [
      homepage,
     
      orderhire,
      wallet,
      profile
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        color: Colors.grey,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: [
          Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
          
          
          Icon(
            Icons.shopping_bag_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.wallet_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.person_outlined,
            color: Colors.white,
          ),
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}
