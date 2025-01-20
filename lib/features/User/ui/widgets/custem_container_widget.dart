import 'package:flutter/material.dart';
import 'package:ibm_flutter_final_project/core/theming/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibm_flutter_final_project/features/User/ui/widgets/custem_user_row.dart';
import 'package:ibm_flutter_final_project/generated/l10n.dart';

class CustemContainerWidget extends StatelessWidget {
  const CustemContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 420.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        color: ColorsManager.mainWhite,
        border: Border.all(
          color: ColorsManager.mainGrey,
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 20.w, vertical: 16.h), // Adjust padding
        child: Column(
          children: [
            CustemUserRow(), // Default row
            SizedBox(height: 25.h), // Vertical space
            CustemUserRow(
              text: S.of(context).settings,
              image: 'assets/images/settings.png',
            ),
            SizedBox(height: 25.h),
            CustemUserRow(
              text: S.of(context).forgot_password,
              image: 'assets/images/loack.png',
            ),
            SizedBox(height: 25.h),
            CustemUserRow(
              text: S.of(context).about,
              image: 'assets/images/about.png',
            ),
          ],
        ),
      ),
    );
  }
}
