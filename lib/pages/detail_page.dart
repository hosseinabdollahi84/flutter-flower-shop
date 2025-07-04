import 'package:flutter/material.dart';
import 'package:flutter_application_7/constants/constants.dart';
import 'package:flutter_application_7/models/plant.dart';
import 'package:flutter_application_7/pages/cart_page.dart';

class Detailpage extends StatefulWidget {
  final int plantid;
  final String imageUrl;
  final String heroTag;

  const Detailpage({
    super.key,
    required this.imageUrl,
    required this.heroTag,
    required this.plantid,
  });

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  int add = 0;
  bool toggleIsselected(bool isSelected12) {
    return !isSelected12;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> plantList = Plant.plantList;

    return Scaffold(
      body: Stack(
        children: [
          //AppBar............................
          Positioned(
            top: 70,
            right: 20,
            left: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Constants.primaryColor.withOpacity(0.15),
                    ),
                    child: Icon(
                      Icons.close,
                      color: Constants.primaryColor,
                    ),
                  ),
                ), //like......................
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Constants.primaryColor.withOpacity(0.15),
                  ),
                  child: Icon(
                    plantList[widget.plantid].isFavorated == true
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(20),
              width: size.width * 0.8,
              height: size.height * 0.8,
              child: Stack(
                children: [
                  Positioned(
                    top: 25,
                    right: 0,
                    child: SizedBox(
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          PlantFeatur(
                            title: 'اندازه گیاه',
                            plantFeatur: plantList[widget.plantid].size,
                          ),
                          PlantFeatur(
                            title: 'رطوبت‌هوا ',
                            plantFeatur: plantList[widget.plantid]
                                .humidity
                                .toString()
                                .farsinumber1,
                          ),
                          PlantFeatur(
                            title: 'دما‌نگه‌داری ',
                            plantFeatur: plantList[widget.plantid]
                                .temperature
                                .toString()
                                .farsinumber1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 80, right: 50),
              height: size.height * 0.5,
              width: size.width,
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: const Color.fromARGB(255, 29, 97, 31).withOpacity(0.4),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0, bottom: 20),
                            child: Icon(
                              Icons.star,
                              size: 30,
                              color: Color.fromARGB(255, 39, 92, 41),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 3.0, bottom: 16),
                            child: Text(
                              plantList[widget.plantid]
                                  .rating
                                  .toString()
                                  .farsinumber1,
                              style: const TextStyle(
                                fontSize: 22,
                                fontFamily: 'lale',
                                color: Color.fromARGB(255, 39, 92, 41),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            plantList[widget.plantid].plantName,
                            style: const TextStyle(
                              fontSize: 30,
                              fontFamily: 'lale',
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 39, 92, 41),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                child: Image.asset(
                                  'assets/images/PriceUnit-green.png',
                                  height: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                plantList[widget.plantid]
                                    .price
                                    .toString()
                                    .farsinumber1
                                    .farsinumber1,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'lale',
                                  fontWeight: FontWeight.bold,
                                  color: Constants.blackColors,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(
                      plantList[widget.plantid].decription,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'iransans',
                        color: Constants.blackColors.withOpacity(0.7),
                        height: 1.5,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          //image hero....................
          Positioned(
            top: 150,
            left: -30,
            right: 120,
            child: Hero(
              tag: widget.heroTag,
              child: SizedBox(
                height: 320,
                child: Image.asset(
                  widget.imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 50,
        width: size.width * 0.9,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0.0, 1.1),
                    blurRadius: 5,
                  ),
                ],
                color: Constants.primaryColor.withOpacity(0.9),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Stack(children: [
                Positioned(
                  left: 36,
                  child: Text(
                    '$add',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    //.......................
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                ),
              ]),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0.0, 1.1),
                      blurRadius: 6,
                    ),
                  ],
                  color: Constants.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: InkResponse(
                    onTap: () {
                      setState(
                        () {
                          bool isSelected1 = toggleIsselected(
                            plantList[widget.plantid].isSelected,
                          );
                          plantList[widget.plantid].isSelected = isSelected1;
                          add = 1;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(seconds: 3),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor:
                                  Constants.blackColors.withOpacity(0.7),
                              content: const Row(
                                textDirection: TextDirection.ltr,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      textDirection: TextDirection.rtl,
                                      'گیاه با موفقیت انتخاب شد',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontFamily: 'iransans',
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Icon(
                                    Icons.verified,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                      ;
                    },
                    child: const Text(
                      "افزودن به سبد خرید",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'lale',
                        color: Colors.white,
                        height: 1.3,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PlantFeatur extends StatelessWidget {
  final String title;
  final String plantFeatur;
  const PlantFeatur(
      {super.key, required this.plantFeatur, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 20, fontFamily: 'lale', color: Constants.blackColors),
        ),
        Text(
          plantFeatur,
          style: TextStyle(
              fontSize: 18,
              fontFamily: 'lale',
              fontWeight: FontWeight.w900,
              color: Constants.primaryColor),
        ),
      ],
    );
  }
}

extension Farsinumber1 on String {
  String get farsinumber1 {
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
