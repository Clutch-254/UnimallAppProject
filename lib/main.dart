import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:unimall_app/features/app/splash_screen/splash_screen.dart';
import 'package:unimall_app/features/user_auth/presentation/pages/login_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDjBFp1Jn5wOQtbNIYP3xRD4aYZ-43dqc4",
          appId: "1:193565610900:web:2d597e48bddb6844e73581",
          messagingSenderId: "193565610900",
          projectId: "unimall-14f7c"),
    );
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Unimall",
      home: SplashScreen(
        child: LoginPage(),
      ),
    );
  }
}
