// lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fl_vitatraz_app/theme/theme.dart';
import 'home_screen.dart';
import 'welcome_screen.dart';



class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController    = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading       = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    setState(() => _isLoading = true);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Error desconocido')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

Future<void> _signInWithGoogle() async {
  setState(() => _isLoading = true);
  try {
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      // Usuario canceló
      return;
    }
    final googleAuth = await googleUser.authentication;
    final googleCred = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(googleCred);
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);

  } on FirebaseAuthException catch (e, s) {
    // Imprimir código y mensaje de error
    debugPrint('⚠️ FirebaseAuthException: code=${e.code}, message=${e.message}');
    debugPrint('Stack trace:\n$s');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error al iniciar con Google: ${e.message}')),
    );
  } catch (e, s) {
    // Errores genéricos
    debugPrint('⚠️ Error genérico en Google Sign-In: $e');
    debugPrint('Stack trace:\n$s');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Error inesperado al iniciar con Google')),
    );
  } finally {
    setState(() => _isLoading = false);
  }
}


  /// Muestra un diálogo para que el usuario confirme su contraseña
  Future<String?> _askForPassword(String email) {
    final _pwCtrl = TextEditingController();
    return showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: Text('Vincular cuenta', style: GoogleFonts.manrope()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Para vincular Google con $email,\nintroduce tu contraseña:',
              style: GoogleFonts.manrope(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _pwCtrl,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, null),
            child: Text('Cancelar', style: GoogleFonts.manrope()),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, _pwCtrl.text.trim()),
            child: Text('Aceptar', style: GoogleFonts.manrope()),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.primaryBackground,
          body: SafeArea(
            top: true,
            bottom: false,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Column(
                children: [
                  // Icono
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
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    cursorColor: AppColors.primaryText,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.accent2,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
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
                    obscureText: _obscurePassword,
                    textAlign: TextAlign.center,
                    cursorColor: AppColors.primaryText,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.accent2,
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
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
                      onPressed: _signIn,
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
                      onPressed: _signInWithGoogle,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.primary),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                      Navigator.pushNamed(context, WelcomeScreen.routeName);
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
        ),

        // Loader overlay
        if (_isLoading)
          const Opacity(
            opacity: 0.6,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
        if (_isLoading) const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}
