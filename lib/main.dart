import 'package:app_scanner_qrcode/routes/routes.dart';
import 'package:colours/colours.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        fontFamily: 'Montserrat',
        primarySwatch: Colours.swatch('#00796b'),
      ),
      initialRoute: RouteController.getHomeRoute(),
      getPages: RouteController.routes,
    );
  }
}
