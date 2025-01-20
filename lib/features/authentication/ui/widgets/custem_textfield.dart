import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:flutter_svg/svg.dart';
>>>>>>> 7034fb3d3010a94d23685c8a8a0061497f1fdf0b
import 'package:ibm_flutter_final_project/core/theming/colors.dart';

class CustemTextfield extends StatelessWidget {
  final String? text;
  final Icon? icon;
  final Icon? suffixIcon;
  final TextInputType? textInputType;
  final bool? obscuredText;
  final TextEditingController? textEditingController;
  final String? Function(String?) Validator;
<<<<<<< HEAD
  final Function(String)? func;
=======
>>>>>>> 7034fb3d3010a94d23685c8a8a0061497f1fdf0b

  const CustemTextfield(
      {super.key,
      this.text,
      this.icon,
      this.textInputType,
      this.suffixIcon,
      this.obscuredText,
      required this.Validator,
<<<<<<< HEAD
      this.func,
=======
>>>>>>> 7034fb3d3010a94d23685c8a8a0061497f1fdf0b
      this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
<<<<<<< HEAD
      onChanged: (value) => func!(value),
=======
>>>>>>> 7034fb3d3010a94d23685c8a8a0061497f1fdf0b
      controller: textEditingController,
      obscureText: obscuredText ?? false,
      keyboardType: textInputType ?? TextInputType.emailAddress,
      validator: Validator,
      decoration: InputDecoration(
          fillColor: ColorsManager.mainGrey,
          hintText: text ?? 'abc@email.com',
<<<<<<< HEAD
          prefixIcon: icon ?? const Icon(Icons.mail_outlined),
          suffixIcon: suffixIcon,
          border: const OutlineInputBorder(
=======
          prefixIcon: icon ?? Icon(Icons.mail_outlined),
          suffixIcon: suffixIcon ?? null,
          border: OutlineInputBorder(
>>>>>>> 7034fb3d3010a94d23685c8a8a0061497f1fdf0b
              borderRadius: BorderRadius.all(Radius.circular(12)))),
    );
  }
}
