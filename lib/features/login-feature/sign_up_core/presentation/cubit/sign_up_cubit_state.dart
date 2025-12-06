part of 'sign_up_cubit_cubit.dart';


abstract class SignUpCubitState {}

final class SignUpCubitInitial extends SignUpCubitState {}
final class SignUpLoadingState extends SignUpCubitState {}
final class SignUpSuccessState extends SignUpCubitState {}
final class SignUpFailureState extends SignUpCubitState {
  final String errorMessage;
  SignUpFailureState(this.errorMessage);
}
