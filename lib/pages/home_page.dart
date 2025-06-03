import 'package:flutter/material.dart';
import 'package:flutter_application_7/constants/constants.dart';
import 'package:flutter_application_7/pages/login_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  bool isActive = false;

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 90000),
      height: 10,
      width: isActive ? 20 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Constants.primaryColor,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }

  List<Widget> _buildindicator() {
    List<Widget> indicator = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicator.add(_indicator(true));
      } else {
        indicator.add(_indicator(false));
      }
    }
    return indicator;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.only(top: 14, right: 16),
              child: Text(
                "رد کردن",
                style: TextStyle(
                  color: Color.fromARGB(255, 114, 114, 114),
                  fontFamily: "zakhim",
                  fontSize: 15,
                ),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            children: [
              pages(
                image: "assets/images/plant1.png",
                title: Constants.titleOne,
                description: Constants.descriptionOne,
              ),
              pages(
                image: "assets/images/plant2.png",
                title: Constants.titleTwo,
                description: Constants.descriptionTwo,
              ),
              pages(
                image: "assets/images/plant3.png",
                title: Constants.titleThree,
                description: Constants.descriptionThree,
              ),
            ],
          ),
          Positioned(
            bottom: 80,
            left: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildindicator(),
            ),
          ),
          Positioned(
            bottom: 66,
            right: 30,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Constants.primaryColor,
              ),
              child: IconButton(
                onPressed: () {
                  setState(
                    () {
                      if (currentIndex < 2) {
                        currentIndex++;
                        if (currentIndex < 3) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn,
                          );
                        }
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Loginpage(),
                          ),
                        );
                      }
                    },
                  );
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class pages extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  const pages({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  State<pages> createState() => _pagesState();
}

// ignore: camel_case_types
class _pagesState extends State<pages> {
  double _opacity = 0.0;
  double _scale = 0.8;
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1.0;
        _scale = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            child: AnimatedScale(
              scale: _scale,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: SizedBox(
                width: 300,
                height: 270,
                child: Image.asset(widget.image),
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            child: AnimatedScale(
              scale: _scale,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              child: Text(
                widget.title,
                style: TextStyle(
                  fontFamily: "iransans",
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Constants.primaryColor,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60),
            child: AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
              child: AnimatedScale(
                scale: _scale,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
                child: Text(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 114, 114, 114),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
