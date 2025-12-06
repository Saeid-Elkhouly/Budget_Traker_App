import 'package:budget_tracker_app/core/networking/firebase_helper.dart';
import 'package:budget_tracker_app/core/routing/routes.dart';
import 'package:budget_tracker_app/features/login-feature/data/repos/login_repo_impl.dart';
import 'package:budget_tracker_app/features/login-feature/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:budget_tracker_app/features/login-feature/presentation/home_view.dart';
import 'package:budget_tracker_app/features/login-feature/presentation/views/login_view.dart';
import 'package:budget_tracker_app/features/login-feature/sign_up_core/data/repos/sign_up_repo_impl.dart';
import 'package:budget_tracker_app/features/login-feature/sign_up_core/presentation/cubit/sign_up_cubit_cubit.dart';
import 'package:budget_tracker_app/features/login-feature/sign_up_core/presentation/views/sign_up_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routing {
  //singleton pattern
  Routing._internal();
  static final Routing _instance = Routing._internal();
  static Routing get instance => _instance;
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(
              LoginRepoImpl(firebaseHelper: FirebaseHelper.instance),
            ),
            child: const LoginView(),
          ),
        );
      case Routes.signUpView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                SignUpCubit(SignUpRepoImpl(FirebaseHelper.instance)),
            child: const SignUpView(),
          ),
        );
      case Routes.homeView:
        return MaterialPageRoute(builder: (context) => const HomeView());
      default:
        return MaterialPageRoute(builder: (context) => const NoRouteView());
    }
  }
}

class NoRouteView extends StatelessWidget {
  const NoRouteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('No Route Found')));
  }
}
