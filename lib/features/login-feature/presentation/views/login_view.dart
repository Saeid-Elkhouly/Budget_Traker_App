import 'dart:developer';

import 'package:budget_tracker_app/core/routing/routes.dart';

import 'package:budget_tracker_app/core/theme/app_styles.dart';
import 'package:budget_tracker_app/core/utils/constants/app_assets.dart';
import 'package:budget_tracker_app/features/login-feature/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:budget_tracker_app/features/login-feature/presentation/views/widgets/header_login.dart';
import 'package:budget_tracker_app/features/login-feature/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          // Navigate to Home
          Navigator.pushReplacementNamed(context, Routes.homeView);
        } else if (state is LoginFailure) {
          // Show error message
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          log('Login Failure: ${state.errorMessage}');
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            SizedBox.expand(
              child: Image(
                image: AssetImage(AppAssets.kBgLoginView),
                fit: BoxFit.cover,
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(bottom: bottomInset),
              child: Column(
                children: [
                  SizedBox(height: 95.h),
                  const HeaderLogin(),
                  SizedBox(height: 20.h),
                  Center(child: LoginViewBody()),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Text(
                      'By continuing you agree to our Terms of Service and Privacy Policy',
                      textAlign: TextAlign.center,
                      style: AppStyles.font12w500grey,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: AppStyles.font12w500white,
                      ),
                      SizedBox(width: 6.w),
                      Text('Sign Up', style: AppStyles.font14Boldamber),
                    ],
                  ),
                  SizedBox(height: 50.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
