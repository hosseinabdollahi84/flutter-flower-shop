import 'package:flutter/material.dart';
import 'package:flutter_application_7/constants/constants.dart';
import 'package:flutter_application_7/models/plant.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedIndex = 0;
  final List<Plant> _plantlist = Plant.plantList; // api👨‍💻
  bool toggleisfavorit(bool isFavorit) {
    return !isFavorit;
  }

  final List<String> _plantTypes = [
    '| پیشنهادی |',
    '| آپارتمانی |',
    '| محل کار |',
    '| گل باغچه ای |',
    '| گل سمی |',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        //Search................
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 16,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              width: size.width * 0.9,
              decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Icon(
                    Icons.mic,
                    color: Constants.blackColors.withOpacity(0.5),
                  ),
                  const Expanded(
                    child: TextField(
                      showCursor: false,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(right: 7),
                        hintText: "...جستجو",
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontFamily: "iransans",
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: Constants.blackColors.withOpacity(0.5),
                  ),
                ],
              ),
            ),
          ),
          //category..............
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 8),
            height: 60,
            width: size.width,
            child: ListView.builder(
              reverse: true,
              scrollDirection: Axis.horizontal,
              itemCount: _plantTypes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: AnimatedScale(
                      scale: selectedIndex == index ? 1.1 : 0.9,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "iransans",
                          fontWeight: selectedIndex == index
                              ? FontWeight.bold
                              : FontWeight.w500,
                          color: selectedIndex == index
                              ? Constants.primaryColor
                              : Constants.blackColors,
                        ),
                        child: Text(_plantTypes[index]),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Product one.................
          SizedBox(
            height: size.height * 0.3,
            child: ListView.builder(
              reverse: true,
              scrollDirection: Axis.horizontal,
              itemCount: _plantlist.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 18),
                  width: 200,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(218, 57, 126, 56),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10,
                        right: 20,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              _plantlist[index].isFavorated == true
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: Colors.amber,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 50,
                        top: 50,
                        right: 50,
                        bottom: 50,
                        child: Image.asset(
                          _plantlist[index].imageURL,
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        left: 20,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            r'$' + _plantlist[index].price.toString(),
                            style: TextStyle(
                                color: Constants.primaryColor, fontSize: 16),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        right: 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              _plantlist[index].category,
                              style: const TextStyle(
                                  fontFamily: "iransans",
                                  color: Colors.white,
                                  fontSize: 14),
                            ),
                            Text(
                              _plantlist[index].plantName,
                              style: const TextStyle(
                                  // fontFamily: "iransans",
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
