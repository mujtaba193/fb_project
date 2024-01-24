/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fb_project/models/users_profile_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final usersProfileProvider = FutureProvider<UsersProfileModel>((ref) {
  // List<UsersProfileModel> data = [];
  Future fetchDataFromFire() async {
    final snapShot = await FirebaseFirestore.instance.collection('users').get();
    final usersProfilData =
        snapShot.docs.map((e) => UsersProfileModel.fromSnapshot(e)).toList();
    return usersProfilData;
  }

  throw '';
});*/
