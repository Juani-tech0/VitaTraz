import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:fl_vitatraz_app/theme/theme.dart';

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
              // Logo / imagen central
              Image.asset(
                'assets/images/logo.png',
                width: size.width * 0.6,
                fit: BoxFit.contain,
              ),
          
              // Botón "Start"
              SizedBox(
                width: size.width * 0.4,
                height: 40,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
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
