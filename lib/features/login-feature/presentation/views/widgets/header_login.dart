import 'package:budget_tracker_app/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Welcome Back!', style: AppStyles.font25BoldWhite),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'please enter your information to login',
            style: AppStyles.font12w500grey,
          ),
        ),
      ],
    );
  }
}
