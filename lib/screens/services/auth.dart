import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fb_project/models/user.dart';
import 'package:fb_project/screens/authenticate/forgot_password_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController userName = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _inst = FirebaseFirestore.instance;
  final ForgotPasswordScreen _for = ForgotPasswordScreen();
  String _token = '';
  final naviKey = GlobalKey<NavigatorState>();

  // create user object based on User (FirebaseUser)
  Userr? _userFromFirebaseUser(User? user) {
    return Userr(uid: user!.uid);
  }

  // auth change user stream
  Stream<Userr?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
    // onAuthStateChanged changed to
  }

  // sign in anon

  // sign in with (register) email and password
  Future loginwithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      // Authresult has been changed to Usercredential
      User? user = result.user; // Firebaseuser has been changed to user
      return _userFromFirebaseUser(user!);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // log in  with email and password
  Future signUpwithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // Authresult has been changed to Usercredential
      User? user = result.user; // Firebaseuser has been changed to user
      return _userFromFirebaseUser(user!);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // add user details
  Future addUserDetails(String userName, String email) async {
    // CollectionReference<Map<String, dynamic>> add = _inst.collection('users');
    await FirebaseFirestore.instance.collection('users').doc().set({
      'name': userName,
      'email': email,
    });
  }

  // sin out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // reset password method.
  Future resetPassword(TextEditingController email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
    } on FirebaseAuthException catch (e) {
      print('**************Hi this is the error *****************$e');
    }
  }
  /*void getDeviceToken() async {
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
  }*/
}
