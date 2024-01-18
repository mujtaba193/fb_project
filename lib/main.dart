import 'package:fb_project/firebase_options.dart';
import 'package:fb_project/models/user.dart';
import 'package:fb_project/new_page.dart';
import 'package:fb_project/screens/home/wrapper.dart';
import 'package:fb_project/screens/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final naviKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Userr?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Wrapper(),
        navigatorKey: naviKey,
        routes: {'/newPage': (context) => const NewPage()},
      ),
    );
  }
}
