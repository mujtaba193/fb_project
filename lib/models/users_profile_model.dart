import 'package:cloud_firestore/cloud_firestore.dart';

class UsersProfileModel {
  late final String name;
  late final String email;
  //final String urlAvatar;
  UsersProfileModel({required this.name, required this.email});
  factory UsersProfileModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return UsersProfileModel(name: data?["name"], email: data?["email"]);
  }
}