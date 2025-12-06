import 'package:budget_tracker_app/core/theme/app_styles.dart';
import 'package:budget_tracker_app/features/login-feature/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:budget_tracker_app/features/login-feature/widgets/custom_button.dart';
import 'package:budget_tracker_app/features/login-feature/widgets/custom_glossy_container.dart';
import 'package:budget_tracker_app/features/login-feature/widgets/custom_text_field.dart';

import 'package:budget_tracker_app/features/login-feature/presentation/views/widgets/footer_login.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Center(
        child: CustomGlossyContainer(
          height: 450.h,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Email', style: AppStyles.font16BoldWhite),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          errorText: 'Email is required',
                        ),
                        FormBuilderValidators.email(
                          errorText: 'Enter a valid email address',
                        ),
                      ]),
                      controller: emailController,
                      hintText: 'Enter your email',
                      obscureText: false,
                      showSuffixIcon: false,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Password', style: AppStyles.font16BoldWhite),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          errorText: 'Password is required',
                        ),
                      ]),
                      controller: passwordController,
                      showSuffixIcon: true,
                      onTap: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      hintText: 'Enter your password',
                      obscureText: _isObscure,
                    ),
                  ],
                ),
                FooterLogin(),
                BlocBuilder<LoginCubit, LoginState>(
                  // ✅ حددنا types
                  builder: (context, state) {
                    return CustomButton(
                      buttonText: 'Login',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          final email = emailController.text.trim();
                          final password = passwordController.text.trim();
                          context
                              .read<LoginCubit>()
                              .loginUserWithEmailAndPassword(email, password);
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
