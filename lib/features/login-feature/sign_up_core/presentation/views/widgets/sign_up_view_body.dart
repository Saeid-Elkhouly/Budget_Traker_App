import 'package:budget_tracker_app/core/theme/app_styles.dart';
import 'package:budget_tracker_app/features/login-feature/sign_up_core/presentation/cubit/sign_up_cubit_cubit.dart';
import 'package:budget_tracker_app/features/login-feature/widgets/custom_button.dart';
import 'package:budget_tracker_app/features/login-feature/widgets/custom_glossy_container.dart';
import 'package:budget_tracker_app/features/login-feature/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomGlossyContainer(
      height: 560.h,
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Username', style: AppStyles.font16BoldWhite),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    hintText: 'Enter your username',
                    obscureText: false,
                    showSuffixIcon: false,
                  ),
                ],
              ),
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
                      FormBuilderValidators.minLength(
                        8,
                        errorText:
                            'Password must be at least 8 characters long',
                      ),
                      FormBuilderValidators.password(
                        errorText:
                            'Password must contain uppercase, lowercase, number and special character',
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Password Confirmation',
                    style: AppStyles.font16BoldWhite,
                  ),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: 'Password Confirmation is required',
                      ),
                      (val) {
                        if (val != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ]),

                    showSuffixIcon: true,
                    onTap: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    hintText: 'Re-enter your password',
                    obscureText: _isObscure,
                  ),
                ],
              ),

              CustomButton(
                buttonText: 'Sign Up',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    final email = emailController.text.trim();
                    final password = passwordController.text.trim();

                    context.read<SignUpCubit>().signUpWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
