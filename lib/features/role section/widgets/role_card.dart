import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoleCard extends StatelessWidget {
  const RoleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(33.r),
      ),
    );
  }
}