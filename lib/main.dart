import 'package:flutter/material.dart';
import 'package:fl_vitatraz_app/theme/theme.dart';
import 'package:fl_vitatraz_app/screens/screens.dart';
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
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vitatraz App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,

      // La pantalla inicial:
      initialRoute: WelcomeScreen.routeName,
      routes: {
        WelcomeScreen.routeName:    (_) => const WelcomeScreen(),
        LoginScreen.routeName:      (_) => const LoginScreen(),
        HomeScreen.routeName:       (_) => const HomeScreen(),
        MedicationsScreen.routeName:(_) => const MedicationsScreen(),
      },
    );
  }
}
