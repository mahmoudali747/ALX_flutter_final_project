<<<<<<< HEAD
import 'dart:developer';

=======
>>>>>>> 7034fb3d3010a94d23685c8a8a0061497f1fdf0b
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibm_flutter_final_project/core/helpers/spacing.dart';
import 'package:ibm_flutter_final_project/core/theming/colors.dart';
<<<<<<< HEAD
import 'package:ibm_flutter_final_project/core/widgets/image_network_widget.dart';
import 'package:ibm_flutter_final_project/features/workspace_status/data/model/work_space_model.dart';
import 'package:ibm_flutter_final_project/features/workspace_status/ui/widgets/workspace_details.dart';

class WorkspaceItem extends StatefulWidget {
  final WorkSpaceModel workspace;
=======
import 'package:ibm_flutter_final_project/features/workspace_status/data/model/in_progress_model.dart';
import 'package:ibm_flutter_final_project/features/workspace_status/ui/widgets/workspace_details.dart';

class WorkspaceItem extends StatefulWidget {
  final Workspace workspace;
>>>>>>> 7034fb3d3010a94d23685c8a8a0061497f1fdf0b
  const WorkspaceItem({super.key, required this.workspace});

  @override
  State<WorkspaceItem> createState() => _WorkspaceItemState();
}

class _WorkspaceItemState extends State<WorkspaceItem> {
  bool isAvailableActive = true;

  void _toggleAvailability(bool value) {
    setState(() {
      isAvailableActive = value;
    });
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final imageU = widget.workspace.image;
    log(widget.workspace.image);
=======
>>>>>>> 7034fb3d3010a94d23685c8a8a0061497f1fdf0b
    return Card(
      color: Colors.white,
      shadowColor: ColorsManager.mainBlue,
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(12.0.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
<<<<<<< HEAD
            ImageNetworkWidget(imageLink: imageU, hight: 180, width: 100),
=======
            Container(
              width: 100.w,
              height: 120.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                          'assets/images/example.png'))), // just an example
            ),
>>>>>>> 7034fb3d3010a94d23685c8a8a0061497f1fdf0b
            horizantalSpace(16.w),
            Expanded(
              child: WorkspaceDetails(
                workspace: widget.workspace,
                isAvailableActive: isAvailableActive,
                toggleAvailability: _toggleAvailability,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
