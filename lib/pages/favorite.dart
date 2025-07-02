import 'package:flutter/material.dart';
import 'package:flutter_application_7/constants/constants.dart';

import 'package:flutter_application_7/models/plant.dart';

import 'package:flutter_application_7/pages/detail_page.dart';
import 'package:flutter_application_7/pages/home_page.dart';

class FavoritePage extends StatefulWidget {
  final List<Plant> favoritedplant;
  const FavoritePage({super.key, required this.favoritedplant});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Scaffold(
        body: widget.favoritedplant.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      child: Image.asset('assets/images/favorited.png'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "😥علاقه‌مندی خالی است",
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
                height: size.height * 0.5,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.favoritedplant.length,
                  itemBuilder: (context, index) {
                    return NewplantWidget1(
                      plantlist: widget.favoritedplant,
                      index: index,
                    );
                  },
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
              heroTag: 'plantHero1${_plantlist[index].plantId}',
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
                      tag: 'plantHero1${_plantlist[index].plantId}',
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
