import 'package:budget_tracker_app/core/routing/routes.dart';
import 'package:budget_tracker_app/core/theme/app_styles.dart';
import 'package:budget_tracker_app/core/utils/constants/app_assets.dart';
import 'package:budget_tracker_app/features/login-feature/sign_up_core/presentation/cubit/sign_up_cubit_cubit.dart';
import 'package:budget_tracker_app/features/login-feature/sign_up_core/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpCubitState>(
      listener: (context, state) {
        if (state is SignUpLoadingState) {
          showDialog(
            context: context,
            builder: (context) {
              return Center(child: CircularProgressIndicator());
            },
          );
       
        } else if (state is SignUpSuccessState) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, Routes.loginView);
        } else if (state is SignUpFailureState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      child: Scaffold(
        //appBar: AppBar(),
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
              reverse: true,
              physics: BouncingScrollPhysics(),

              child: Column(
                children: [
                  SizedBox(height: 80.h),
                  Text(
                    textAlign: TextAlign.center,
                    'Welcome to Budget Tracker!',
                    style: AppStyles.font25BoldWhite,
                  ),

                  SizedBox(height: 25.h),
                  Center(child: SignUpViewBody()),
                  SizedBox(height: 30.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Text(
                      'By continuing you agree to our Terms of Service and Privacy Policy',
                      textAlign: TextAlign.center,
                      style: AppStyles.font12w500grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
