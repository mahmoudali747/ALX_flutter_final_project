import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibm_flutter_final_project/core/theming/colors.dart';
import 'package:ibm_flutter_final_project/core/theming/styles.dart';
import 'package:ibm_flutter_final_project/features/authentication/ui/widgets/custem_text_widget.dart';
import 'package:ibm_flutter_final_project/generated/l10n.dart';

class CustemButtonAuthentication extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;

  const CustemButtonAuthentication({super.key, this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      splashColor: Colors.transparent,
      onPressed: onPressed,
      child: Container(
        width: 271.w,
        height: 58.h,
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
            SizedBox(
              width: 75.w,
            ),
            CustemText(
              text: text ?? S.of(context).sign_in,
              textStyle: TextStyles.font20WhiteBold,
            ),
            Container(
              padding: EdgeInsets.only(left: 50),
              child: Container(
                width: 30.w,
                height: 30.h,
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
