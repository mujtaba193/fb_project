import 'package:fb_project/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
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

  // sign in with email and password
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

  // log in (register) with email and password

  // sin out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
