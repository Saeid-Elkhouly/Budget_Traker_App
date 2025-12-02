import 'package:budget_tracker_app/features/login-feature/presentation/views/widgets/custom_button.dart';
import 'package:budget_tracker_app/features/login-feature/presentation/views/widgets/custom_glossy_container.dart';

import 'package:budget_tracker_app/features/login-feature/presentation/views/widgets/footer_login.dart';
import 'package:budget_tracker_app/features/login-feature/presentation/views/widgets/text_field_section.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomGlossyContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              //  SizedBox(height: 24),
              TextFieldSection(
                labelText: 'Email',
                hintText: 'Enter your email',
              ),
              // SizedBox(height: 24),
              TextFieldSection(
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
              FooterLogin(),
              CustomButton(buttonText: 'Login', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
