import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileDivider extends StatelessWidget {
  const ProfileDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1.h,
      color: Colors.grey[200],
      indent: 84.w,
      endIndent: 20.w,
    );
  }
}
