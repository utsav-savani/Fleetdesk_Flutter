import 'package:fleetdesk_flutter/core/common/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fleetdesk_flutter/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fleet Desk',
      theme: ThemeData(
        primarySwatch: AppColors.redcolor,
       ),
      home: HomePage(),
    );
  }
}
