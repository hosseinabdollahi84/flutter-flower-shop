import 'package:flutter/material.dart';
import 'package:flutter_application_7/constants/constants.dart';
import 'package:flutter_application_7/pages/cart_page.dart';
import 'package:flutter_application_7/pages/favorite.dart';
import 'package:flutter_application_7/pages/home_page.dart';
import 'package:flutter_application_7/pages/profile_page.dart';

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
    Icons.people,
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.notifications,
              color: Constants.blackColors,
            ),
            Text(
              appBarTitle[bottimIndex],
              style: TextStyle(
                color: Constants.blackColors,
              ),
            ),
          ],
        ),
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
    );
  }
}
