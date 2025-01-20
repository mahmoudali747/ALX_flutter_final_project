import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibm_flutter_final_project/core/helpers/extensions.dart';
import 'package:ibm_flutter_final_project/core/helpers/spacing.dart';
import 'package:ibm_flutter_final_project/core/helpers/string_extensions.dart';
import 'package:ibm_flutter_final_project/core/routing/routes.dart';
import 'package:ibm_flutter_final_project/core/theming/styles.dart';
import 'package:ibm_flutter_final_project/features/authentication/ui/widgets/custem_button_authentication.dart';
import 'package:ibm_flutter_final_project/features/authentication/ui/widgets/custem_text_widget.dart';
import 'package:ibm_flutter_final_project/features/authentication/ui/widgets/custem_textfield.dart';
import 'package:ibm_flutter_final_project/features/authentication/ui/widgets/hyper_text.dart';
import 'package:ibm_flutter_final_project/features/authentication/ui/widgets/logo_widget.dart';
import 'package:ibm_flutter_final_project/generated/l10n.dart';

final _formKey = GlobalKey<FormState>();

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

TextEditingController _password = TextEditingController();
TextEditingController _confirmpassword = TextEditingController();

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30).h,
            child: ListView(
              children: [
                verticalSpace(40),
                LogoWidget(),
                verticalSpace(20),
                CustemText(
                  text: S.of(context).sign_up,
                  textStyle: TextStyles.font20WhiteBold,
                ),
                verticalSpace(20),
                CustemTextfield(
                  text: S.of(context).first_name,
                  icon: Icon(Icons.person),
                  textInputType: TextInputType.name,
                  Validator: (val) {
                    if (!val!.isValidName) {
                      return S.of(context).enter_a_valid_name;
                    }
                    return null;
                  },
                ),
                verticalSpace(20),
                CustemTextfield(
                  text: S.of(context).last_name,
                  icon: Icon(Icons.person),
                  textInputType: TextInputType.name,
                  Validator: (val) {
                    if (!val!.isValidName) {
                      return S.of(context).enter_a_valid_name;
                    }
                    return null;
                  },
                ),
                verticalSpace(20),
                CustemTextfield(
                  Validator: (val) {
                    if (!val!.isValidEmail) {
                      return S.of(context).enter_a_valid_email;
                    }
                    return null;
                  },
                ),
                verticalSpace(20),
                CustemTextfield(
                  text: S.of(context).password,
                  obscuredText: true,
                  icon: Icon(Icons.lock),
                  Validator: (val) {
                    if (!val!.isValidPassword) {
                      return S.of(context).enter_a_valid_password;
                    }
                    return null;
                  },
                  textEditingController: _password,
                ),
                verticalSpace(10),
                verticalSpace(20),
                CustemTextfield(
                  text: S.of(context).confirm_password,
                  obscuredText: true,
                  icon: Icon(Icons.lock),
                  textEditingController: _confirmpassword,
                  Validator: (val) {
                    if (!val!.isValidPassword &&
                        _password.text != _confirmpassword.text) {
                      return S.of(context).its_notconfirmend;
                    }
                    return null;
                  },
                ),
                verticalSpace(30),
                CustemButtonAuthentication(
                  text: S.of(context).sign_up,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                ),
                verticalSpace(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustemText(
                      text: S.of(context).already_have_an_account,
                      textStyle: TextStyles.font15BlackRegular,
                    ),
                    HyperText(
                      text: S.of(context).sign_in,
                      textStyle: TextStyles.font15PurbleRegular,
                      onPressed: () {
                        context.pushNamed(Routes.loginScreen);
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
