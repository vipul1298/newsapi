import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/constants/app_color.dart';
import 'package:newsapp/get_util/all_controller_bindings.dart';
import 'package:newsapp/screens/app_entry.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AllControllerBindings().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      darkTheme: darkTheme,
      initialBinding: AllControllerBindings(),
      title: 'MyNEWS',
      theme: lightTheme,
      home: AppEntry(),
    );
  }

  ThemeData get lightTheme => ThemeData.light().copyWith(
      primaryColor: AppColor.appBLUE,
      visualDensity: VisualDensity.adaptivePlatformDensity);

  ThemeData get darkTheme => ThemeData.dark().copyWith(
      primaryColor: Colors.grey,
      visualDensity: VisualDensity.adaptivePlatformDensity);
}
