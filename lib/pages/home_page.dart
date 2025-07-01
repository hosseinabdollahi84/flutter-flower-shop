import 'package:flutter/material.dart';
import 'package:flutter_application_7/constants/constants.dart';
import 'package:flutter_application_7/models/plant.dart';
import 'package:flutter_application_7/pages/detail_page.dart';

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
                top: 29,
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
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Detailpage(
                            imageUrl: _plantlist[index].imageURL,
                            heroTag: 'plantHero_${_plantlist[index].plantId}',
                            plantid: _plantlist[index].plantId,
                          ),
                        ),
                      );
                    },
                    child: Container(
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
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 350),
                                switchOutCurve: Curves.elasticOut,
                                transitionBuilder: (child, animation) {
                                  return ScaleTransition(
                                      scale: animation, child: child);
                                },
                                child: IconButton(
                                  key: ValueKey(_plantlist[index].isFavorated),
                                  onPressed: () async {
                                    setState(() {
                                      bool isFavorated = toggleisfavorit(
                                        (_plantlist[index].isFavorated),
                                      );
                                      _plantlist[index].isFavorated =
                                          isFavorated;
                                    });
                                  },
                                  icon: Icon(
                                    _plantlist[index].isFavorated == true
                                        ? Icons.favorite
                                        : Icons.favorite_border_outlined,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 50,
                            top: 50,
                            right: 50,
                            bottom: 50,
                            child: Hero(
                              tag: 'plantHero_${_plantlist[index].plantId}',
                              child: Image.asset(
                                _plantlist[index].imageURL,
                              ),
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
                                    color: Constants.primaryColor,
                                    fontSize: 16),
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
                    ),
                  );
                },
              ),
            ),
            //New text
            Container(
              padding: const EdgeInsets.only(
                right: 20,
                bottom: 8,
                top: 13,
              ),
              alignment: Alignment.centerRight,
              child: const Text(
                'گیاهان جدید',
                style: TextStyle(
                  fontFamily: 'zakhim',
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
            ),
            //Product 2 .................
            Container(
              padding: const EdgeInsets.only(
                left: 22,
                right: 22,
              ),
              height: size.height * 0.3,
              child: ListView.builder(
                itemCount: _plantlist.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Detailpage(
                            imageUrl: _plantlist[index].imageURL,
                            heroTag: 'plantHero${_plantlist[index].plantId}',
                            plantid: _plantlist[index].plantId,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10, top: 10),
                      height: 80,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(0.18),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: SizedBox(
                                  height: 20,
                                  child: Image.asset(
                                    'assets/images/PriceUnit-green.png',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                _plantlist[index].price.toString().farsinumber,
                                style: const TextStyle(
                                  fontSize: 21,
                                  fontFamily: 'lale',
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 58, 133, 60),
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 5),
                                width: 68,
                                height: 68,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Constants.primaryColor,
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 13.5,
                                left: 12,
                                child: SizedBox(
                                  height: 70,
                                  child: Hero(
                                    tag:
                                        'plantHero${_plantlist[index].plantId}',
                                    child: Image.asset(
                                      _plantlist[index].imageURL,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 13,
                                right: 80,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      _plantlist[index].category,
                                      style: const TextStyle(
                                          fontSize: 16, fontFamily: "lale"),
                                    ),
                                    Text(
                                      _plantlist[index].plantName,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontFamily: "iransans",
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension Farsinumber on String {
  String get farsinumber {
    const english = [
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
    ];
    const farsi = [
      '۰',
      '۱',
      '۲',
      '۳',
      '۴',
      '۵',
      '۶',
      '۷',
      '۸',
      '۹',
    ];
    String text = this;
    for (var i = 0; i < english.length; i++) {
      text = text.replaceAll(english[i], farsi[i]);
    }
    return text;
  }
}
