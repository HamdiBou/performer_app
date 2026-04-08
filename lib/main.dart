import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/data/api_config.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'base/pref_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ApiConfig.init();

  // Load saved conference URL if user was in a conference
  String? savedConferenceUrl = await PrefData.getBaseUrl();
  if (savedConferenceUrl != null && savedConferenceUrl.isNotEmpty) {
    ApiConfig.setConferenceUrl(savedConferenceUrl);
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.homeRoute,
          getPages: AppPages.routes,
        );
      },
    );
  }
}
