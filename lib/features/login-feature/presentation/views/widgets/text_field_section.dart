import 'package:budget_tracker_app/core/theme/app_styles.dart';
import 'package:budget_tracker_app/features/login-feature/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class TextFieldSection extends StatelessWidget {
  const TextFieldSection({super.key, required this.labelText, required this.hintText});
  final String labelText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [
        Text(labelText, style: AppStyles.font18BoldWhite),
        SizedBox(height: 8),

        SizedBox(
          width: 310,
          child: CustomTextField(hintText: hintText),
        ),
      ],
    );
  }
}
