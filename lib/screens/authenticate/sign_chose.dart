import 'package:fb_project/screens/services/auth.dart';
import 'package:flutter/material.dart';

class SignChose extends StatefulWidget {
  const SignChose({super.key});

  @override
  State<SignChose> createState() => _SignChoseState();
}

class _SignChoseState extends State<SignChose> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chose the sign in way'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {},
              child: Center(child: Text('Sin in anon')),
            ),
          ),
        ],
      ),
    );
  }
}
