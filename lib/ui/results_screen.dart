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
        child: FutureBuilder(
          future: _fetchUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final user = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(user!.avatarUrl, height: 100,),
                    ),
                    Container(height: 10),
                    Text(user.name, style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    )),
                    Container(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          decoration: const BoxDecoration(
                            color: Colors.purple,
                          ),
                          child: Text("Seguidores: ${user.followers}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(width: 16),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          decoration: const BoxDecoration(
                            color: Colors.deepOrange,
                          ),
                          child: Text("Repositórios: ${user.publicRepos}",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else if(snapshot.hasError) {
              return Text("Erro: ${snapshot.error}");
            }

            return const CircularProgressIndicator(
              backgroundColor: Colors.black,
            );
          },
        ),
      ),
    );
  }

  Future<User> _fetchUser() async {
    final response = await http.get(Uri.parse('https://api.github.com/users/$username'));

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Ocorreu um erro');
    }

  }
}