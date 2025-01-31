// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibm_flutter_final_project/core/helpers/spacing.dart';
import 'package:ibm_flutter_final_project/core/theming/colors.dart';
import 'package:ibm_flutter_final_project/core/theming/styles.dart';
import 'package:ibm_flutter_final_project/core/widgets/get_area_name.dart';
import 'package:ibm_flutter_final_project/features/home/ui/widgets/favourite_icon_changer.dart';

class SinglePhoto extends StatelessWidget {
  final String? imageLink;
  final String? title;
  final String? location;
  const SinglePhoto({Key? key, this.imageLink, this.title, this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 222,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: imageLink != null
                      ? NetworkImage(imageLink!)
                      : AssetImage("assets/images/workspace.jpg"),
                  fit: BoxFit.cover)),
        ),
        Padding(
          padding: const EdgeInsets.all(30).h,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        size: 30,
                        Icons.arrow_back_outlined,
                        color: ColorsManager.mainWhite,
                      )),
                  Container(
                    width: 38,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.black87.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(child: ColorChangingIcon()),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 150.h,
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  constraints:
                      BoxConstraints(maxHeight: 200.h, maxWidth: 300.w),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black87.withOpacity(0.7),
                  ),
                  child: Text(
                    title ?? "Titen Office",
                    style: TextStyles.font20WhiteBold,
                  ),
                ),
                verticalSpace(.1),
                Container(
                  constraints:
                      BoxConstraints(maxHeight: 200.h, maxWidth: 300.w),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black87.withOpacity(0.7),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on_sharp,
                        color: Colors.white,
                      ),
                      getLocationText(
                        location: location ?? "",
                      )
                      // Text("Cairo,Nasr City", style: TextStyles.font15WhiteRegular)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
