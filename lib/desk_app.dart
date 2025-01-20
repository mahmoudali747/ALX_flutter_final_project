import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
<<<<<<< HEAD
import 'package:ibm_flutter_final_project/core/helpers/cach_helper.dart';
import 'package:ibm_flutter_final_project/core/routing/app_router.dart';
import 'package:ibm_flutter_final_project/core/routing/routes.dart';
import 'package:ibm_flutter_final_project/features/authentication/data/repos/signup_repo.dart';

String intiRoutes() {
  String? loginAs =
      CacheHelper.sharedPreferences.getString(cacheHelperString.role);
  log("$loginAs");
  if (loginAs == "admin") {
    return Routes.workspaceStatus;
  } else if (loginAs == "client") {
    return Routes.mainHomeScreen;
  } else {
    return Routes.loginScreen;
  }
}
=======
import 'package:ibm_flutter_final_project/core/routing/app_router.dart';
import 'package:ibm_flutter_final_project/core/routing/routes.dart';
>>>>>>> 7034fb3d3010a94d23685c8a8a0061497f1fdf0b

class DeskApp extends StatelessWidget {
  final AppRouter appRouter;
  const DeskApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Doc app',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
<<<<<<< HEAD
        initialRoute: intiRoutes(), //! set your initial route
=======
        initialRoute: Routes.loginScreen, //! set your initial route

>>>>>>> 7034fb3d3010a94d23685c8a8a0061497f1fdf0b
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
