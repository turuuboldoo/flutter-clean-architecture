import 'dart:async';

import 'package:app/config/pages/home_pages.dart';
import 'package:app/config/routes/home_routes.dart';
import 'package:app/config/theme/app_theme.dart';
import 'package:app/di/dependency_injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.inject();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      initialRoute: HomeRoutes.home,
      getPages: HomePages.pages,
    );
  }
}
