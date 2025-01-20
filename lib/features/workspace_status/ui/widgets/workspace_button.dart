import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibm_flutter_final_project/core/theming/colors.dart';

class WorkspaceButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const WorkspaceButton({
    super.key,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
<<<<<<< HEAD
        backgroundColor:
            isActive ? ColorsManager.mainBlue : ColorsManager.Inactive,
=======
        backgroundColor: isActive
            ? ColorsManager.mainBlue
            : ColorsManager.Inactive,
>>>>>>> 7034fb3d3010a94d23685c8a8a0061497f1fdf0b
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
<<<<<<< HEAD
          fontSize: 10.sp,
=======
          fontSize: 12.sp,
>>>>>>> 7034fb3d3010a94d23685c8a8a0061497f1fdf0b
          color: isActive ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
