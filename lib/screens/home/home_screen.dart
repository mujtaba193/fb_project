import 'dart:async';

import 'package:fb_project/main.dart';
import 'package:fb_project/providers/users_profile_provider.dart';
import 'package:fb_project/screens/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final AuthService _auth = AuthService();
  String _token = '';
  @override
  void initState() {
    getDeviceToken();
    initPushNotification();
    //fetchDataFromFire();

    super.initState();
  }

  /*Future<List<UsersProfileModel>> fetchDataFromFire() async {
    final snapShot = await FirebaseFirestore.instance.collection('users').get();
    final usersProfilData =
        snapShot.docs.map((e) => UsersProfileModel.fromSnapshot(e)).toList();

    print("this is *******************%%%%%%***************$usersProfilData");
    return usersProfilData;
  }*/

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
    final usersData = ref.watch(usersProfileProvider);

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
      body: usersData.when(
        data: (mm) {
          return ListView(
              children: mm
                  .map(
                    (e) => ListTile(
                      title: Text(e.name),
                      subtitle: Text(e.email),
                    ),
                  )
                  .toList());
        },
        error: ((error, StackTrace) => const Text('Wo!. its error Chutia')),
        loading: (() {
          return const Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }
}
