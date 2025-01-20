import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibm_flutter_final_project/core/theming/colors.dart';
import 'package:ibm_flutter_final_project/core/theming/styles.dart';
import 'package:ibm_flutter_final_project/features/authentication/ui/widgets/custem_text_widget.dart';

class CustemButtonAuthentication extends StatelessWidget {
  final String? text;
<<<<<<< HEAD
  final double? height;
  final double? width;
  final VoidCallback? onPressed;

  const CustemButtonAuthentication(
      {super.key, this.text, this.onPressed, this.height, this.width});
=======
  final VoidCallback? onPressed;

  const CustemButtonAuthentication({super.key, this.text, this.onPressed});
>>>>>>> 7034fb3d3010a94d23685c8a8a0061497f1fdf0b

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.transparent,
      onPressed: onPressed,
      child: Container(
<<<<<<< HEAD
        width: width ?? 271.w,
        height: height ?? 58.h,
=======
        width: 271.w,
        height: 58.h,
>>>>>>> 7034fb3d3010a94d23685c8a8a0061497f1fdf0b
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorsManager.mainPurble,
                ColorsManager.mainPurble,
                ColorsManager.mainPurbleGradient,
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.sp))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
<<<<<<< HEAD
            SizedBox(),
=======
            SizedBox(
              width: 75.w,
            ),
>>>>>>> 7034fb3d3010a94d23685c8a8a0061497f1fdf0b
            CustemText(
              text: text ?? 'Sign in',
              textStyle: TextStyles.font20WhiteBold,
            ),
            Container(
<<<<<<< HEAD
              child: Container(
                width: 25.w,
                height: 25.w,
=======
              padding: EdgeInsets.only(left: 50),
              child: Container(
                width: 30.w,
                height: 30.h,
>>>>>>> 7034fb3d3010a94d23685c8a8a0061497f1fdf0b
                decoration: const BoxDecoration(
                    color: Color(0xFF3D56F0),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  color: ColorsManager.mainWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
