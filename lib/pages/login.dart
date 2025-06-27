import 'package:flutter/material.dart';
import 'package:flutter_application_7/pages/login_page.dart';
import 'package:page_transition/page_transition.dart';

class Loginpage1 extends StatelessWidget {
  Loginpage1({super.key});

  int add = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // پس‌زمینه تصویری
          Positioned.fill(
            child: Image.asset(
              'assets/images/back.png', // مسیر تصویر
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            bottom: 220,
            left: 50,
            child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: LoginScreen(),
                          type: PageTransitionType.rightToLeft));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(90, 236, 235, 235),
                    borderRadius: BorderRadius.circular(44),
                  ),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 170,
            left: 115,
            child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: LoginScreen(),
                          type: PageTransitionType.rightToLeft));
                },
                child: const Text(
                  'Create an account',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
