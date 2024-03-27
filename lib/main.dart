import 'package:firebase_learn/core/network/connectivity_service.dart';
import 'package:firebase_learn/presentation/themes/app_theme.dart';
import 'package:firebase_learn/routes/app_routes.dart';
import 'package:firebase_learn/utils/clear_focus_observer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ConnectivityService().startMonitoring();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.login,
      getPages: AppPages.pages,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      navigatorObservers: [ClearFocusOnNavigateObserver()],
    );
  }
}
