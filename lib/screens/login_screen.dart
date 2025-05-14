import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:fl_vitatraz_app/theme/theme.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _emailFocusNode = FocusNode();

  final _passwordController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocusNode.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: SafeArea(
        top: true,
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Column(
            children: [
              // Icono grande arriba
              SizedBox(
                width: double.infinity,
                height: size.height * 0.35,
                child: Center(
                  child: Icon(
                    Icons.person_outline,
                    color: AppColors.secondaryText,
                    size: size.height * 0.18,
                  ),
                ),
              ),

              // Email label
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Email',
                  style: GoogleFonts.manrope(
                    fontSize: 16,
                    color: AppColors.primaryText,
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // Email field
              TextFormField(
                controller: _emailController,
                focusNode: _emailFocusNode,
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                cursorColor: AppColors.primaryText,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.accent2,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(height: 20),

              // Password label
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Password',
                  style: GoogleFonts.manrope(
                    fontSize: 16,
                    color: AppColors.primaryText,
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // Password field
              TextFormField(
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                obscureText: _obscurePassword,
                textAlign: TextAlign.center,
                cursorColor: AppColors.primaryText,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.accent2,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.primaryText,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                style: GoogleFonts.manrope(
                  fontSize: 16,
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(height: 10),

              // Forgot password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/forgotPassword');
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(50, 30),
                  ),
                  child: Text(
                    'Forgot password?',
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                      color: AppColors.primaryText,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Log In button
              SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Log In',
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondaryBackground,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Or login with
              Text(
                'or Log In with',
                style: GoogleFonts.manrope(
                  fontSize: 14,
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(height: 16),

              // Google button
              SizedBox(
                width: double.infinity,
                height: 40,
                child: OutlinedButton(
                  onPressed: () {
                    // Google sign-in
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // 
                      Image.asset(
                        'assets/google_logo.png',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Continue with Google',
                        style: GoogleFonts.manrope(
                          fontSize: 16,
                          color: AppColors.primaryText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Sign Up link
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signUp');
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(50, 30),
                ),
                child: Text(
                  "Don't have an account? Sign Up",
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                    color: AppColors.primaryText,
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
