import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const outlineBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
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
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Container(height: 30.0),
                const TextField(
                  decoration: InputDecoration(
                    border: outlineBorder,
                    focusedBorder: outlineBorder,
                    // hintText: 'username',
                    labelText: 'username',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
                Container(height: 10.0),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(Colors.black),
                    minimumSize: MaterialStateProperty.all(const Size(double.maxFinite, 50)),
                    
                  ),
                  onPressed: () { },
                  child: const Text(
                    'Buscar',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}