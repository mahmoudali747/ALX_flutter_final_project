// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ibm_flutter_final_project/core/helpers/utils.dart';
import 'package:ibm_flutter_final_project/core/networks/dio_consumer.dart';
import 'package:ibm_flutter_final_project/core/networks/dio_exceptions.dart';
import 'package:ibm_flutter_final_project/core/networks/end_point.dart';
import 'package:ibm_flutter_final_project/features/add_new_workspace/logic/workSpaceCubit/work_space_state.dart';

class WorkSpaceRepo {
  DioConsumer dio;
  WorkSpaceRepo({
    required this.dio,
  });
  Future<WorkSpaceState> deleteNewWorkSpace(String workSpaceId) async {
    try {
      String accessToken = await getAccessToken(dio);

      final addNewWorkspaceResponce = await dio.delete(
          EndPoint.addWorkSpace, accessToken,
          data: {"work_space_id": workSpaceId}, isFormData: true);
      WorkSpaceState workSpaceData =
          WorkSpaceState.fromMap(addNewWorkspaceResponce);
      return workSpaceData;
    } on ServerException catch (e) {
      rethrow;
    }
  }

  Future<WorkSpaceState> updateWorkSpace(
      WorkSpaceState workSpace, String workSpaceId) async {
    try {
      log("image state second state${workSpace.imageFile}");

      MultipartFile? image;
      if (workSpace.imageFile != null) {
        image = await imageCompress(workSpace.imageFile!);
      }
      log("image state third state${image}");
      String accessToken = await getAccessToken(dio);

      final workSpaceMap = workSpace.toMap(image);

      workSpaceMap["work_space_id"] = workSpaceId;

      workSpaceMap
          .removeWhere((key, value) => value == null || value == ""); //***** */

      if (workSpace.title == null) {
        workSpaceMap.remove("title");
      }
      if (workSpace.description == null) {
        workSpaceMap.remove("description");
      }

      final addNewWorkspaceResponce = await dio.put(
        EndPoint.addWorkSpace,
        accessToken,
        data: workSpaceMap,
        isFormData: true,
      );

      WorkSpaceState workSpaceData =
          WorkSpaceState.fromMap(addNewWorkspaceResponce);
      return workSpaceData;
    } on ServerException catch (e) {
      rethrow;
    }
  }

  Future<WorkSpaceState> addNewWorkSpace(WorkSpaceState workSpace) async {
    try {
      MultipartFile? image;
      if (workSpace.imageFile != null) {
        image = await imageCompress(workSpace.imageFile!);
      }

      String accessToken = await getAccessToken(dio);
      Map<String, dynamic> workspaceData = workSpace.toMap(image);
      final addNewWorkspaceResponce = await dio.post(
          EndPoint.addWorkSpace, accessToken,
          data: workspaceData, isFormData: true);
      WorkSpaceState workSpaceData =
          WorkSpaceState.fromMap(addNewWorkspaceResponce);
      return workSpaceData;
    } on ServerException catch (e) {
      rethrow;
    }
  }
}
