import 'package:budget_tracker_app/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glossy/glossy.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.buttonText,
    this.onTap,
    this.child,
  });

  final String buttonText;
  final void Function()? onTap;
  final Widget? child;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;

  void _onTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
    widget.onTap?.call();
  }

  void _onTapCancel() {
    setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        transform: Matrix4.translationValues(0, _isPressed ? 4 : 0, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          boxShadow: _isPressed
              ? [] // يقل الظل عند الضغط
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    offset: const Offset(0, 4),
                    blurRadius: 6,
                  ),
                ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: widget.onTap,
            splashColor: Colors.purple.withValues(alpha: 0.3), // ripple effect
            highlightColor: Colors.transparent,
            child: GlossyContainer(
              height: 50.h,
              width: double.infinity,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Colors.white.withValues(alpha: (0.4)),
                width: 1,
              ),
              gradient: GlossyLinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [const Color(0xff5f3759), Colors.amber],
                opacity: 0.7,
              ),
              child: Center(
                child:
                    widget.child ??
                    Text(widget.buttonText, style: AppStyles.font16BoldWhite),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
