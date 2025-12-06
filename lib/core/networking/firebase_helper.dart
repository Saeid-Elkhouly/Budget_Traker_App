

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {
//singleton pattern
  FirebaseHelper._privateConstructor();
  static final FirebaseHelper _instance = FirebaseHelper._privateConstructor();
  static FirebaseHelper get instance => _instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  Future<User?> loginUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }
  Future<User?> signUpUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }
}
