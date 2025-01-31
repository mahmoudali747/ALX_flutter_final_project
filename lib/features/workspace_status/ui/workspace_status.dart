<<<<<<< HEAD
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibm_flutter_final_project/core/di/dependancy_injection.dart';
import 'package:ibm_flutter_final_project/core/helpers/extensions.dart';
import 'package:ibm_flutter_final_project/core/helpers/spacing.dart';
import 'package:ibm_flutter_final_project/core/routing/routes.dart';
import 'package:ibm_flutter_final_project/core/theming/colors.dart';
import 'package:ibm_flutter_final_project/core/theming/styles.dart';
import 'package:ibm_flutter_final_project/core/widgets/app_text_button.dart';
import 'package:ibm_flutter_final_project/features/User/ui/User_screen.dart';
import 'package:ibm_flutter_final_project/features/add_new_workspace/logic/workSpaceCubit/work_space_cubit.dart';
import 'package:ibm_flutter_final_project/features/add_new_workspace/logic/workSpaceCubit/work_space_state.dart';
import 'package:ibm_flutter_final_project/features/adminControls/logic/bookingCubit/bookings_cubit.dart';
import 'package:ibm_flutter_final_project/features/adminControls/ui/booking_screen.dart';
import 'package:ibm_flutter_final_project/features/roomScreen/logic/getAdminRoomsCubit/admin_rooms_cubit.dart';
import 'package:ibm_flutter_final_project/features/workspace_status/logic/cubit/get_admin_work_spaces_cubit.dart';
import 'package:ibm_flutter_final_project/features/workspace_status/logic/cubit/get_admin_work_spaces_state.dart';
import 'package:ibm_flutter_final_project/features/workspace_status/logic/navigationBar/navigation_bar_cubit.dart';
import 'package:ibm_flutter_final_project/features/workspace_status/logic/navigationBar/navigation_bar_state.dart';
import 'package:ibm_flutter_final_project/features/workspace_status/ui/widgets/search_bar.dart';
import 'package:ibm_flutter_final_project/features/workspace_status/ui/widgets/workspace_item.dart';

List<Widget> NavigationBarWidgets = [
  const UserScreen(),
  const ExploreScreen(),
  const BookingScreen(),
];

=======
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibm_flutter_final_project/core/helpers/extensions.dart';
import 'package:ibm_flutter_final_project/core/helpers/spacing.dart';
import 'package:ibm_flutter_final_project/core/routing/routes.dart';
import 'package:ibm_flutter_final_project/core/theming/styles.dart';
import 'package:ibm_flutter_final_project/core/widgets/app_text_button.dart';
import 'package:ibm_flutter_final_project/features/workspace_status/data/model/in_progress_model.dart';
import 'package:ibm_flutter_final_project/features/workspace_status/ui/widgets/search_bar.dart';
import 'package:ibm_flutter_final_project/features/workspace_status/ui/widgets/workspace_item.dart';

>>>>>>> 7034fb3d3010a94d23685c8a8a0061497f1fdf0b
class WorkspaceStatus extends StatelessWidget {
  const WorkspaceStatus({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final navigationBarCubit = getIt<NavigationBarCubit>();
    final newWorkSpaceCubit = getIt<WorkSpaceCubit>();
    final bookingCubit = getIt<BookingsCubit>();

    return Scaffold(
      body: BlocBuilder<NavigationBarCubit, NavigationBarState>(
        bloc: navigationBarCubit,
        builder: (context, state) {
          log("nav changed -----------------------------");

          return NavigationBarWidgets[navigationBarCubit.state.currentIndex];
        },
      ),
      floatingActionButton: BlocBuilder<NavigationBarCubit, NavigationBarState>(
        bloc: navigationBarCubit,
        builder: (context, state) {
          return state.currentIndex == 1
              ? AppTextButton(
                  buttonWidth: 120.w,
                  buttonText: "Add New ",
                  buttonStyle: TextStyles.font16WhiteBold,
                  onPress: () async {
                    newWorkSpaceCubit
                        .workSpaceStatusChange(WorkSpaceStatus.addNew);
                    newWorkSpaceCubit.clearAll();

                    context.pushNamed(Routes.addNewWorkSpace);
                  },
                )
              : const SizedBox();
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationBarCubit, NavigationBarState>(
          bloc: navigationBarCubit,
          builder: (context, state) {
            return BottomNavigationBar(
              currentIndex: navigationBarCubit.state.currentIndex,
              iconSize: 35,
              backgroundColor: Colors.white,
              onTap: (value) {
                navigationBarCubit.changeCurrentIndex(value);
              },
              selectedItemColor:
                  ColorsManager.mainBlue, // Highlight color for selected tab
              unselectedItemColor: Colors.grey, // Color for unselected tabs
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.explore),
                  label: 'Explore',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month_rounded),
                  label: 'Booked',
                ),
              ],
            );
          }),
    );
  }
}

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<GetAdminWorkSpacesCubit>();

    final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
        GlobalKey<RefreshIndicatorState>();

    Future<void> refreshData() async {
      await cubit.fetchData();
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<AdminRoomsCubit, AdminRoomsState>(
          bloc: getIt<AdminRoomsCubit>(),
          builder: (context, state) {
            return Stack(
              children: [
                Column(
                  children: [
                    verticalSpace(20),
                    const SearchingBar(),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "  Workspaces",
                        style: TextStyles.font24BlackSemiBold,
                      ),
                    ),
                    Expanded(
                      child: RefreshIndicator(
                        key: refreshIndicatorKey,
                        onRefresh: refreshData,
                        child: BlocBuilder<GetAdminWorkSpacesCubit,
                            GetAdminWorkSpacesState>(
                          bloc: cubit,
                          builder: (context, state) {
                            log("rebuilded with state ${state}");
                            if (state is GetAdminWorkSpacesLoudingState) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state
                                is GetAdminWorkSpacesFialierState) {
                              // Still allow refresh even in failure
                              return ListView(
                                children: [
                                  Center(
                                    child: Text(state.message),
                                  ),
                                ],
                              );
                            } else if (state
                                is GetAdminWorkSpacesSuccessState) {
                              // Display the list of workspaces
                              return ListView(
                                children: state.workSpaceModeList!
                                    .map((workSpace) =>
                                        WorkspaceItem(workspace: workSpace))
                                    .toList(),
                              );
                            } else {
                              // Handle unhandled states with an empty scrollable ListView
                              return ListView(
                                children: const [
                                  Center(
                                    child: Text('No data available'),
                                  ),
                                ],
                              );
                            }
                          },
                        ),
=======
    //Dummy Data :)
    Map<String, Workspace> workspaces = {
      'workspace1': Workspace(
          name: 'X-Space',
          image: 'assets/images/ex.png',
          description: " this is Example for description! :) "),
      'workspace2': Workspace(
          name: 'I-Tech',
          image: 'assets/images/ex.png',
          description: "Flexible leasing options to fit your need "),
      'workspace3': Workspace(
          name: 'IBM',
          image: 'assets/images/ex.png',
          description: "Prime location with easy access to transportation :) "),
    };

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_rounded),
        backgroundColor: Colors.white,
        title: const Text("Search", style: TextStyle(color: Colors.black)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SearchingBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("  Workspaces", style: TextStyles.font24BlackSemiBold),
                    ...workspaces.values
                        .map((workspace) => WorkspaceItem(workspace: workspace))
                        .toList(),
                    verticalSpace(10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: AppTextButton(
                        buttonText: "Add New Workspace",
                        buttonStyle: TextStyles.font16WhiteBold,
                        onPress: () {
                          context.pushNamed(Routes.addNewWorkSpace);
                        },
>>>>>>> 7034fb3d3010a94d23685c8a8a0061497f1fdf0b
                      ),
                    ),
                  ],
                ),
<<<<<<< HEAD
                (state is AdminRoomsLoading)
                    ? Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: ColorsManager.mainBlack.withOpacity(.000001),
                      )
                    : const SizedBox(),
                (state is AdminRoomsLoading)
                    ? Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                              color: ColorsManager.lightGrey.withOpacity(.5),
                              borderRadius: BorderRadius.circular(12)),
                          width: 150.w,
                          height: 150.w,
                          child:
                              const Center(child: CircularProgressIndicator()),
                        ),
                      )
                    : const SizedBox(),
              ],
            );
          },
=======
              ),
            ),
          ],
>>>>>>> 7034fb3d3010a94d23685c8a8a0061497f1fdf0b
        ),
      ),
    );
  }
}
