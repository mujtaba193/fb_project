import 'package:fb_project/models/user.dart';
import 'package:fb_project/screens/authenticate/authenticate.dart';
import 'package:fb_project/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Userr?>(context);

    if (user == null) {
      print(user);

      return Authenticate();
    } else {
      return HomePage();
      // return HomePage();
    }
  }
}
