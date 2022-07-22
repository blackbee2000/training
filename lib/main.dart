import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/instance_manager.dart';
import 'package:training/themes/app_theme.dart';

import 'routes/app_pages.dart';

void main() async {
  // final storage = new GetStorage();
  runZoned<Future<Null>>(() async {
    runApp(MyApp());
    // Future.delayed(Duration(milliseconds: 1000)).then((_) async {
    //   await storage.write('intro', true);
    // });
  });
}

class MyApp extends StatelessWidget {
  // final storage = new GetStorage();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(
        () {
          // Get.put(AuthService());
        },
      ),
      initialRoute: AppRoutes.HOME,
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
      // translations: LocaleString(),
      // locale: AppTranslation.instance.language,
      theme: AppTheme.light,
      // darkTheme: AppTheme.dark,
      themeMode: AppTheme.instance.theme,
    );
  }
}
