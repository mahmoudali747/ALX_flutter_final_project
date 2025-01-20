import 'package:flutter/material.dart';
import 'package:ibm_flutter_final_project/core/helpers/spacing.dart';
import 'package:ibm_flutter_final_project/core/theming/styles.dart';
import 'package:ibm_flutter_final_project/features/authentication/ui/widgets/custem_button_authentication.dart';
import 'package:ibm_flutter_final_project/features/authentication/ui/widgets/custem_text_widget.dart';
import 'package:ibm_flutter_final_project/features/authentication/ui/widgets/custem_textfield.dart';
import 'package:ibm_flutter_final_project/features/authentication/ui/widgets/logo_widget.dart';
import 'package:ibm_flutter_final_project/generated/l10n.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: [
            LogoWidget(),
            verticalSpace(30),
            CustemText(
              text: S.of(context).reset_password,
              textStyle: TextStyles.font24BlackBold,
            ),
            CustemText(
              text: S.of(context).enter_email_for_reset,
              textStyle: TextStyles.font15BlackRegular,
            ),
            verticalSpace(30),
            CustemTextfield(
              Validator: (val) {},
            ),
            verticalSpace(30),
            CustemButtonAuthentication(
              text: S.of(context).send,
            ),
          ],
        ),
      )),
    );
  }
}
