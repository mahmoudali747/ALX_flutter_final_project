<<<<<<< HEAD
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibm_flutter_final_project/core/di/dependancy_injection.dart';
import 'package:ibm_flutter_final_project/core/helpers/extensions.dart';
import 'package:ibm_flutter_final_project/core/helpers/spacing.dart';
import 'package:ibm_flutter_final_project/core/routing/routes.dart';
import 'package:ibm_flutter_final_project/core/theming/styles.dart';
import 'package:ibm_flutter_final_project/features/roomScreen/logic/getAdminRoomsCubit/admin_rooms_cubit.dart';
import 'package:ibm_flutter_final_project/features/workspace_status/data/model/work_space_model.dart';

import 'workspace_button.dart';

class WorkspaceDetails extends StatelessWidget {
  final WorkSpaceModel workspace;
=======
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibm_flutter_final_project/core/helpers/spacing.dart';
import 'package:ibm_flutter_final_project/core/theming/styles.dart';
import 'package:ibm_flutter_final_project/features/workspace_status/data/model/in_progress_model.dart';
import 'workspace_button.dart';

class WorkspaceDetails extends StatelessWidget {
  final Workspace workspace;
>>>>>>> 7034fb3d3010a94d23685c8a8a0061497f1fdf0b
  final bool isAvailableActive;
  final void Function(bool) toggleAvailability;

  const WorkspaceDetails({
    super.key,
    required this.workspace,
    required this.isAvailableActive,
    required this.toggleAvailability,
  });

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final cubit = getIt<AdminRoomsCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(workspace.title, style: TextStyles.fonst18BlackBold),
        verticalSpace(8.h),
        Text('- ${workspace.description}', style: TextStyles.font14GreyRegular),
=======
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(workspace.name, style: TextStyles.fonst18BlackBold),
        verticalSpace(8.h),
        Text('- ${workspace.description}',
            style: TextStyles.font14GreyRegular),
>>>>>>> 7034fb3d3010a94d23685c8a8a0061497f1fdf0b
        verticalSpace(12.h),
        Row(
          children: [
            WorkspaceButton(
<<<<<<< HEAD
              label: "edit rooms",
              isActive: isAvailableActive,
              onTap: () async {
                log("enter cubit");
                await cubit.fetchRooms(workspace.id);

                context.pushNamed(Routes.adminRoomsScreen,
                    arguments: workspace);
              },
            ),
            horizantalSpace(8.w),
            WorkspaceButton(
              
              label: "edit workSpace",
              isActive: isAvailableActive,
              onTap: () {
                context.pushNamed(Routes.addNewWorkSpace, arguments: workspace);
              },
=======
              label: "Available",
              isActive: isAvailableActive,
              onTap: () => toggleAvailability(true),
            ),
            horizantalSpace(8.w),
            WorkspaceButton(
              label: "Hide",
              isActive: !isAvailableActive,
              onTap: () => toggleAvailability(false),
>>>>>>> 7034fb3d3010a94d23685c8a8a0061497f1fdf0b
            ),
          ],
        ),
      ],
    );
  }
}
