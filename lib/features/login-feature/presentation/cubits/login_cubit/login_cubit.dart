import 'package:budget_tracker_app/features/login-feature/data/repos/login_repo_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepoImpl) : super(LoginInitial());
  final LoginRepoImpl loginRepoImpl;

  Future<void> loginUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    emit(LoginLoading());
    try {
      await loginRepoImpl.loginUserWithEmailAndPassword(email, password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if(e.code == 'user-not-found') {
        emit(LoginFailure(errorMessage: 'No user found for that email.'));
        return;
      } else if(e.code == 'wrong-password') {
        emit(LoginFailure(errorMessage: 'Wrong password provided for that user.'));
        return;
      }
      emit(
        LoginFailure(errorMessage: e.message ?? 'An unknown error occurred'),
      );
    } catch (e) {
      emit(LoginFailure(errorMessage: e.toString()));
    }
  }
}
