import 'package:budget_tracker_app/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:glossy/glossy.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.buttonText, this.onTap});
  final String buttonText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

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
          child: Text(buttonText, style: AppStyles.font16BoldWhite),
        ),
      ),
    );
  }
}
