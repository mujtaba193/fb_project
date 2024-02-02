import 'package:cloud_firestore/cloud_firestore.dart';

class UsersProfileModel {
  final String name;
  final String email;
  //final String urlAvatar;
  UsersProfileModel({required this.name, required this.email});
  factory UsersProfileModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    //final datat = document.data();
    return UsersProfileModel(name: document['name'], email: document['email']);
  }
}
