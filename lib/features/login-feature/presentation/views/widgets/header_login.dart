import 'package:budget_tracker_app/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Welcome Back!', style: AppStyles.font25BoldWhite),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              'please enter your information to login',
              style: AppStyles.font12w500grey,
            ),
          ),
        ],
      ),
    );
  }
}
