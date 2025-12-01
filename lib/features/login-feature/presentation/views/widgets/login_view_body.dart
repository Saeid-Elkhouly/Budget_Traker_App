import 'package:budget_tracker_app/core/theme/app_styles.dart';
import 'package:budget_tracker_app/features/login-feature/presentation/views/widgets/custom_glossy_container.dart';
import 'package:flutter/material.dart';
import 'package:glossy/glossy.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomGlossyContainer(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              //  SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  Text('Email', style: AppStyles.font18BoldWhite),
                  SizedBox(height: 8),

                  SizedBox(
                    width: 310,
                    child: TextField(
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('password', style: AppStyles.font18BoldWhite),
                  SizedBox(height: 8),
                  SizedBox(
                    width: 310,
                    child: TextField(
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(
                          color: Colors.white70,
                          fontSize: 15,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      Text('Remember Me', style: AppStyles.font12BoldWhite),
                    ],
                  ),

                  Text('Forgot Password?', style: AppStyles.font14BoldPurple),
                ],
              ),
              InkWell(
                onTap: () {},

                child: GlossyContainer(
                  height: 50,

                  width: double.infinity,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.4),
                    width: 1,
                  ),
                  gradient: GlossyLinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,

                    colors: [Color(0xff5f3759), Colors.amber],
                    opacity: 0.7,
                  ),
                  child: Center(
                    child: Text('Login', style: AppStyles.font16BoldWhite),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
