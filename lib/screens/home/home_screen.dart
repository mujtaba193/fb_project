import 'package:fb_project/screens/services/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 63, 63, 63),
        actions: [
          ElevatedButton.icon(
            onPressed: () async {
              setState(() async {
                await _auth.signOut();
              });
            },
            icon: Icon(Icons.person),
            label: Text('Logout'),
          ),
        ],
      ),
      body: Center(
        child: Text('This is home page'),
      ),
    );
  }
}
