import 'package:flutter/material.dart';
import 'package:flutter_application_7/models/plant.dart';

class Cartpage extends StatefulWidget {
  final List<Plant> mycart;
  const Cartpage({super.key, required this.mycart});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("سبد خرید")),
    );
  }
}
