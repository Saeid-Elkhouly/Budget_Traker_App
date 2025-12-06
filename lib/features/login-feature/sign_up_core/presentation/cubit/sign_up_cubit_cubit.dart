import 'package:budget_tracker_app/features/login-feature/sign_up_core/data/repos/sign_up_repo_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_cubit_state.dart';

class SignUpCubit extends Cubit<SignUpCubitState> {
  SignUpCubit(this.signUpRepoImpl) : super(SignUpCubitInitial());
  final SignUpRepoImpl signUpRepoImpl;

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SignUpLoadingState());
    try {
      await signUpRepoImpl.signUpUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SignUpSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(SignUpFailureState(e.message ?? 'An unknown error occurred'));
    } catch (e) {
      emit(SignUpFailureState(e.toString()));
    }
  }
}
