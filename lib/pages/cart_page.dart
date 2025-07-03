import 'package:flutter/material.dart';
import 'package:flutter_application_7/constants/constants.dart';
import 'package:flutter_application_7/models/plant.dart';
import 'package:flutter_application_7/pages/detail_page.dart';
import 'package:flutter_application_7/pages/home_page.dart';

class Cartpage extends StatefulWidget {
  final List<Plant> mycart;
  const Cartpage({super.key, required this.mycart});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Scaffold(
        body: widget.mycart.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 120,
                      child: Image.asset('assets/images/add-cart.png'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "🙄سبد خرید خالیه ی چی بخر",
                      style: TextStyle(fontFamily: 'lale', fontSize: 18),
                    )
                  ],
                ),
              )
            : Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 30,
                ),
                // height: size.height * 0.5,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: widget.mycart.length,
                        itemBuilder: (context, index) {
                          return NewplantWidget1(
                            plantlist: widget.mycart,
                            index: index,
                          );
                        },
                      ),
                    ),
                    Column(
                      children: [
                        const Divider(
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: SizedBox(
                                    height: 23,
                                    child: Image.asset(
                                      'assets/images/PriceUnit-green.png',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '33000'.farsinumber1,
                                  style: const TextStyle(
                                    fontSize: 23,
                                    fontFamily: 'lale',
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 58, 133, 60),
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              'جمع کل',
                              style: TextStyle(
                                  fontFamily: 'lale',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
      ),
    );
  }
}

class NewplantWidget1 extends StatelessWidget {
  const NewplantWidget1({
    super.key,
    required List<Plant> plantlist,
    required this.index,
  }) : _plantlist = plantlist;

  final List<Plant> _plantlist;
  final int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Detailpage(
              imageUrl: _plantlist[index].imageURL,
              heroTag: 'plantHero2${_plantlist[index].plantId}',
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
                  _plantlist[index].price.toString().farsinumber1,
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
                      tag: 'plantHero2${_plantlist[index].plantId}',
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
                        style:
                            const TextStyle(fontSize: 16, fontFamily: "lale"),
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
