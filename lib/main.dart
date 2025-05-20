// lib/main.dart
import 'package:flutter/material.dart';
import 'package:fl_vitatraz_app/theme/app_theme.dart';
import 'package:fl_vitatraz_app/screens/login_screen.dart';
import 'package:fl_vitatraz_app/screens/home_screen.dart';
import 'package:fl_vitatraz_app/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: WelcomeScreen.routeName,
      routes: {
        WelcomeScreen.routeName: (_) => const WelcomeScreen(),
        LoginScreen.routeName:   (_) => const LoginScreen(),
        HomeScreen.routeName:    (_) => const HomeScreen(),
        '/forgotPassword':       (_) => const WelcomeScreen(), // provisional
      },
    );
  }
}
