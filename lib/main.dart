import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/controllers/auth_controller.dart';
import 'package:tiktok_clone/views/screens/auth/login_screen.dart';
import 'package:tiktok_clone/views/screens/auth/singup_screen.dart';

import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (kIsWeb) {
  //   await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //         apiKey: "AIzaSyDDTa10McyAWClXaq-q8sCxmcq8hMNW0zs",
  //         authDomain: "tiktok-clone-71671.firebaseapp.com",
  //         projectId: "tiktok-clone-71671",
  //         storageBucket: "tiktok-clone-71671.appspot.com",
  //         messagingSenderId: "1040405518352",
  //         appId: "1:1040405518352:web:c89f5295840ed570df1295"),
  //   ).then((value) {
  //     Get.put(AuthController());
  //   },);
  // } else {
  await Firebase.initializeApp().then(
    (value) => Get.put(AuthController()),
  );
  //}
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tik Tok Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: LoginScreen(),
    );
  }
}
