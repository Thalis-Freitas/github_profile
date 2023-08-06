import 'package:flutter/material.dart';

import 'package:github_profile/ui/results_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final TextEditingController _username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          _buildHeader(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Container(height: 30.0),
                _buildUsernameTextField(),
                Container(height: 10.0),
                _buildSearchButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(120)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(50),
        child: Image.asset(
          'assets/images/icon_github.png',
          height: 120,
        ),
      ),
    );
  }

  Widget _buildUsernameTextField() {
    const outlineBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
      ),
    );

    return TextField(
      controller: _username,
      decoration: const InputDecoration(
        border: outlineBorder,
        focusedBorder: outlineBorder,
        labelText: 'username',
        labelStyle: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _buildSearchButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.black),
        minimumSize:
            MaterialStateProperty.all(const Size(double.maxFinite, 50)),
      ),
      onPressed: () {
        _navigateToResultsScreen(context);
      },
      child: const Text(
        'Buscar',
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }

  void _navigateToResultsScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ResultsScreen(username: _username.value.text)),
    );
  }
}
