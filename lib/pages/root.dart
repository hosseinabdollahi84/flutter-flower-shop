import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/constants/constants.dart';
import 'package:flutter_application_7/pages/cart_page.dart';
import 'package:flutter_application_7/pages/favorite.dart';
import 'package:flutter_application_7/pages/home_page.dart';
import 'package:flutter_application_7/pages/profile_page.dart';
import 'package:flutter_application_7/pages/scan_page.dart';
import 'package:page_transition/page_transition.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootpageState();
}

class _RootpageState extends State<RootPage> {
  int bottimIndex = 0; //for....bottomNavigationBar

  List<Widget> page = const [
    Homepage(),
    FavoritePage(),
    Cartpage(),
    ProfilePage(),
  ];
  List<IconData> iconlist = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];
  List<String> appBarTitle = [
    'خانه',
    'علاقه‌مندی‌ها',
    'سبد‌خرید',
    'پروفایل',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.notifications,
                color: Constants.blackColors,
                size: 27,
              ),
              Text(
                appBarTitle[bottimIndex],
                style: TextStyle(
                  fontFamily: "zakhim",
                  fontSize: 24,
                  color: Constants.blackColors,
                ),
              ),
            ],
          ),
        ),
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: bottimIndex,
        children: page,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              PageTransition(
                  child: const ScanPage(),
                  type: PageTransitionType.bottomToTop));
        },
        backgroundColor: Constants.primaryColor,
        child: Image.asset(
          'assets/images/code-scan-two.png',
          height: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        activeIndex: bottimIndex,
        inactiveColor: Constants.blackColors.withOpacity(0.5),
        gapLocation: GapLocation.center,
        icons: iconlist,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            bottimIndex = index;
          });
        },
      ),
    );
  }
}
