import 'package:budget_tracker_app/core/networking/firebase_helper.dart';
import 'package:budget_tracker_app/features/login-feature/sign_up_core/data/repos/sign_up_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepoImpl implements SignUpRepo {
  final FirebaseHelper _firebaseHelper;

  SignUpRepoImpl(this._firebaseHelper);

  @override
  Future<User?> signUpUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _firebaseHelper.signUpUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
