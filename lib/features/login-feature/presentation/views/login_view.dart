import 'package:budget_tracker_app/core/theme/app_styles.dart';

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
            top: 80,
            left: 12,
            right: 0,

            child: Text('Welcome Back!', style: AppStyles.font25BoldWhite),
          ),

          LoginViewBody(),
        ],
      ),
    );
  }
}
