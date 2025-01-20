import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import 'package:flutter_screenutil/flutter_screenutil.dart';
>>>>>>> 7034fb3d3010a94d23685c8a8a0061497f1fdf0b

class CustemText extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;

  const CustemText({super.key, this.text, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text(
<<<<<<< HEAD
      textAlign: TextAlign.center,
=======
>>>>>>> 7034fb3d3010a94d23685c8a8a0061497f1fdf0b
      text ?? "place holder",
      style: textStyle,
    );
  }
}
