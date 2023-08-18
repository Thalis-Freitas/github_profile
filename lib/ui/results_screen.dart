import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:github_profile/models/user.dart';

class ResultsScreen extends StatelessWidget {
  final String username;

  const ResultsScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Resultados'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: _buildUserDetailsOrLoading(),
      ),
    );
  }

  Widget _buildUserDetailsOrLoading() {
    return FutureBuilder(
      future: _fetchUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(
            backgroundColor: Colors.black,
          );
        } else if (snapshot.hasData && snapshot.data is User) {
          return _buildUserDetails(snapshot.data as User);
        } else {
          return Container(
            padding: const EdgeInsets.all(40),
            child: _buildStat("Resultado da busca", snapshot.data, Colors.red),
          );
        }
      },
    );
  }

  Widget _buildUserDetails(User user) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(user.avatarUrl, height: 100,),
          ),
          Container(height: 10),
          Text(
            user.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(height: 16),
          _buildFollowersAndRepos(user),
        ],
      ),
    );
  }

  Widget _buildFollowersAndRepos(User user) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStat("Seguidores", "${user.followers}", Colors.purple),
        Container(width: 16),
        _buildStat("Repositórios", "${user.publicRepos}", Colors.deepOrange),
      ],
    );
  }

  Widget _buildStat(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: color,
      ),
      child: Text(
        "$label: $value",
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Future _fetchUser() async {
    final response = await http.get(Uri.parse('https://api.github.com/users/$username'));

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      return 'Usuário "$username" inválido ou não encontrado.';
    }
  }
}
