import 'package:budget_tracker_app/core/networking/firebase_helper.dart';
import 'package:budget_tracker_app/features/login-feature/data/repos/login_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepoImpl implements LoginRepo {
  FirebaseHelper firebaseHelper;

  LoginRepoImpl({required this.firebaseHelper});
  @override
  Future<User?> loginUserWithEmailAndPassword (
    String email,
    String password,
  )async {
    return await firebaseHelper.loginUserWithEmailAndPassword(
      email: email,
      password: password,
    );
        
  }
}
