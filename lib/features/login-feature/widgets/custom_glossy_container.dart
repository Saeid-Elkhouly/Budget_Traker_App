import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glossy/glossy.dart';

class CustomGlossyContainer extends StatelessWidget {
  const CustomGlossyContainer({super.key, this.child, required this.height});
  final Widget? child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GlossyContainer(
      opacity: 0.06,
      border: Border.all(
        color: Colors.white.withValues(alpha: 0.2),
        width: 0.5,
      ),
      strengthX: 0.5,
      strengthY: 0.5,
      width: 370.w,
      height: height,
      borderRadius: BorderRadius.circular(12),
      child: child,
    );
  }
}
