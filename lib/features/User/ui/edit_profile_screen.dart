import 'package:flutter/material.dart';
import 'package:ibm_flutter_final_project/core/helpers/extensions.dart';
import 'package:ibm_flutter_final_project/core/helpers/spacing.dart';
import 'package:ibm_flutter_final_project/core/routing/routes.dart';
import 'package:ibm_flutter_final_project/core/theming/styles.dart';
import 'package:ibm_flutter_final_project/features/User/ui/widgets/icon_button_widget.dart';
import 'package:ibm_flutter_final_project/features/User/ui/widgets/imge_picker_widget.dart';
import 'package:ibm_flutter_final_project/features/authentication/ui/widgets/custem_button_authentication.dart';
import 'package:ibm_flutter_final_project/features/authentication/ui/widgets/custem_text_widget.dart';
import 'package:ibm_flutter_final_project/features/authentication/ui/widgets/custem_textfield.dart';
import 'package:ibm_flutter_final_project/generated/l10n.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButtonWidget(
                  onPressed: () {
                    context.pop();
                  },
                ),
              ],
            ),
            Center(
              child: CustemText(
                text: S.of(context).edit_profile,
                textStyle: TextStyles.font24BlackBold,
              ),
            ),
            verticalSpace(20),
            ImgePickerWidget(),
            verticalSpace(40),
            CustemTextfield(
              Validator: (p0) {},
              text: S.of(context).first_name,
              icon: Icon(Icons.person),
            ),
            verticalSpace(20),
            CustemTextfield(
              Validator: (p0) {},
              text: S.of(context).last_name,
              icon: Icon(Icons.person),
            ),
            verticalSpace(20),
            CustemTextfield(
              Validator: (p0) {},
            ),
            verticalSpace(20),
            CustemTextfield(
              Validator: (p0) {},
              text: S.of(context).your_phone_number,
              icon: Icon(Icons.phone),
            ),
            verticalSpace(30),
            CustemButtonAuthentication(
              text: S.of(context).update,
              onPressed: () {
                context.pushNamed(Routes.userScreen);
              },
            )
          ],
        ),
      )),
    );
  }
}
