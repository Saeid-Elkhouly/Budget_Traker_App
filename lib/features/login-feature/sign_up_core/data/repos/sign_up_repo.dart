import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpRepo {
  Future<User?> signUpUserWithEmailAndPassword({
    required String email,
    required String password,
  });
}
