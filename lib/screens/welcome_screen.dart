// lib/screens/welcome_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_vitatraz_app/theme/theme.dart';
import 'package:fl_vitatraz_app/screens/login_screen.dart';
import 'package:fl_vitatraz_app/screens/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = '/welcome';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        top: true,
        bottom: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/logo.png',
                width: size.width * 0.6,
                fit: BoxFit.contain,
              ),

              SizedBox(
                width: size.width * 0.4,
                height: 40,
                child: OutlinedButton(
                  onPressed: () async {
                    final user = FirebaseAuth.instance.currentUser;

                    if (user != null) {
                      try {
                        // Fuerza recarga desde servidor
                        await user.reload();
                        // Si sigue existiendo, vamos a Home
                        Navigator.pushReplacementNamed(
                            context, HomeScreen.routeName);
                        return;
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          // Usuario borrado: cerramos sesión y vamos a Login
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushReplacementNamed(
                              context, LoginScreen.routeName);
                          return;
                        }
                      }
                    }

                    // Si no había usuario antes, vamos a Login
                    Navigator.pushReplacementNamed(
                        context, LoginScreen.routeName);
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.secondaryBackground),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    'Start',
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondaryBackground,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
