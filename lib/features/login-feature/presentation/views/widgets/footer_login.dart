import 'package:budget_tracker_app/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class FooterLogin extends StatelessWidget {
  const FooterLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(value: false, onChanged: (value) {}),
            Text('Remember Me', style: AppStyles.font12w400White),
          ],
        ),

        Text('Forgot Password?', style: AppStyles.font14BoldPurple),
      ],
    );
  }
}
