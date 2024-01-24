import 'package:fb_project/main.dart';
import 'package:fb_project/screens/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();
  String _token = '';
  @override
  void initState() {
    getDeviceToken();
    initPushNotification();

    super.initState();
  }

  void getDeviceToken() async {
    final _fbMessaging = FirebaseMessaging.instance;
    _token = await FirebaseMessaging.instance.getToken() ?? '';

    await _fbMessaging.requestPermission();
    print('hhhhhhhhh this is the token: $_token');
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) return; // if the message is null do nothing
    naviKey.currentState?.pushNamed('/newPage', arguments: message);
  }

  // function to initialize background settings
  Future initPushNotification() async {
    // handle notification if the app was terminated and opened
    FirebaseMessaging.instance.getInitialMessage().then((handleMessage));
    // attach event listeners for when a notification opens the app
    FirebaseMessaging.onMessageOpenedApp.listen((handleMessage));
  }

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
              await FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.person),
            label: Text('Logout'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text('This is home page'),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class FbApi {
  // create instance of firebase messaging.
  final _fbMessaging = FirebaseMessaging.instance;

  // create function to initialize notification
  Future<void> initNotification() async {
    // request permission from the user to send notifications
    await _fbMessaging.requestPermission();
  }
}
