import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibm_flutter_final_project/core/di/dependancy_injection.dart';
import 'package:ibm_flutter_final_project/core/helpers/extensions.dart';
import 'package:ibm_flutter_final_project/core/helpers/spacing.dart';
import 'package:ibm_flutter_final_project/core/routing/routes.dart';
import 'package:ibm_flutter_final_project/core/theming/styles.dart';
import 'package:ibm_flutter_final_project/core/widgets/image_network_widget.dart';
import 'package:ibm_flutter_final_project/features/User/logic/book_room/book_room_cubit.dart';
import 'package:ibm_flutter_final_project/features/home/logic/availableRoomHours/available_room_hours_cubit.dart';
import 'package:ibm_flutter_final_project/features/home/ui/widgets/comfortable_place_iems_button.dart';
import 'package:ibm_flutter_final_project/features/home/ui/widgets/favourite_icon_changer.dart';
import 'package:ibm_flutter_final_project/features/roomScreen/data/models/room_model.dart';

class ComfortablePlaceItems extends StatelessWidget {
  List<RoomModel>? roomModelList;
  void Function()? onTap;

  String? location;

  ComfortablePlaceItems({this.roomModelList, this.onTap, this.location});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 245.h,
      child: ListView.builder(
          itemCount: roomModelList?.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final entry = roomModelList?[index];
            log("${entry?.endDate}");
            return CustemConfortablePlace(
              buttonOnTap: onTap ??
                  () {
                    getIt<AvailableRoomHoursCubit>().clear();
                    getIt<BookRoomDataCubit>().clearAll();

                    context.pushNamed(Routes.bookingRoom, arguments: entry);
                  },
              imageLink: entry?.imageLink,
              itemName: entry?.title,
              location: location,
              price: entry?.pricePerHour.toString(),
            );
          }),
    );
  }
}

class CustemConfortablePlace extends StatelessWidget {
  final String? price;
  final String? itemName;
  final String? imagePath;
  final String? location;
  final double? buttonHight;
  final double? buttonWidth;
  final String? buttontext;
  final int? itemsLength;
  final bool? buttonhasIcon;
  final int? index;
  final String? imageLink;
  final void Function()? buttonOnTap;

  const CustemConfortablePlace({
    super.key,
    this.price,
    this.itemName,
    this.imagePath,
    this.location,
    this.buttonHight,
    this.buttonWidth,
    this.buttontext,
    this.buttonhasIcon,
    this.itemsLength,
    this.index,
    this.imageLink,
    this.buttonOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              // Image Section
              imageLink != null
                  ? ImageNetworkWidget(
                      imageLink: imageLink!, hight: 100, width: 100)
                  : Image(
                      image: AssetImage("assetName"),
                    ),
              horizantalSpace(14),
              // Text and Info Section
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(itemName ?? "Women's leadership \n conference",
                          style: TextStyles.font16BlackBold),
                      verticalSpace(10),
                      ComfortablePlaceIemsButton(
                        text: buttontext ?? "book",
                        buttonHight: buttonHight,
                        buttonWidth: buttonWidth,
                        onTap: buttonOnTap,
                        hasIcon: buttonhasIcon ?? true,
                      ),
                    ],
                  ),
                ),
              ),
              // Price Section
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ColorChangingIcon(),
                  Text(price ?? "3.0", style: TextStyles.font13PurbleSemiBold),
                  Text("EGP/Hour", style: TextStyles.font14GreyRegular),
                ],
              ),
              horizantalSpace(10)
            ],
          ),
        ),
        // itemsLength != null && index != null && (itemsLength! - 1) == index!
        //     ? verticalSpace(70)
        //     : verticalSpace(10),
      ],
    );
  }
}
