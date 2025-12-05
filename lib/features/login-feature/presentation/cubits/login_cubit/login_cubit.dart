import 'package:budget_tracker_app/features/login-feature/data/repos/login_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepoImpl) : super(LoginInitial());
 final  LoginRepoImpl loginRepoImpl;
 

  Future<void> loginUserWithEmailAndPassword(String email, String password) async{
emit(LoginLoading());
    try {
  await loginRepoImpl.loginUserWithEmailAndPassword(email, password);
  emit(LoginSuccess());
}  catch (e) {
emit(LoginFailure(errorMessage: e.toString()));
}
  }
}
