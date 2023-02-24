import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:insee/pages/analytics.dart';
import 'package:insee/pages/login.dart';
import 'pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      theme: ThemeData(),
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginPage(),
        ),
        GetPage(
          name: '/home',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/analytics',
          page: () => Analytics(),
        ),
      ],
    );
  }
}
