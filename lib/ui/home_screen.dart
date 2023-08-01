import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(120))
        ),
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Image.asset(
            'assets/images/icon_github.png',
            height: 120,
          ),
        ),
      ),
    );
  }
}