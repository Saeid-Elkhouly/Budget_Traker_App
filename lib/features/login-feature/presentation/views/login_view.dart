import 'package:budget_tracker_app/core/theme/app_styles.dart';
import 'package:budget_tracker_app/features/login-feature/presentation/views/widgets/header_login.dart';

import 'package:budget_tracker_app/features/login-feature/presentation/views/widgets/login_view_body.dart';
import 'package:budget_tracker_app/utils/constants/app_assets.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image(
              image: AssetImage(AppAssets.kBgLoginView),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 95,
            left: 12,
            right: 0,

            child: const HeaderLogin(),
          ),

          LoginViewBody(),
          Positioned(
            top: 620,
            left: 30,
            right: 30,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                maxLines: 2,
                overflow: TextOverflow.visible,
                'By continuing you agree to our Terms of Service and Privacy Policy',
                textAlign: TextAlign.center,
                style: AppStyles.font12w500grey,
              ),
            ),
          ),
          Positioned(
            top: 675,
            left: 30,
            right: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text(
                  'Don\'t have an account?',
                  style: AppStyles.font12w500white,
                ),
                SizedBox(width: 6),
                Text('Sign Up', style: AppStyles.font14Boldamber),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
